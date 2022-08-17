﻿using AspNetCoreHero.ToastNotification.Abstractions;
using LokiPKL.Extensions;
using LokiPKL.Models;
using LokiPKL.ModelViews;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace LokiPKL.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly Loki_PKLContext _context;
        public INotyfService _notifyService { get; }

        public ShoppingCartController(Loki_PKLContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        public static bool isEmail(string inputEmail)
        {
            inputEmail = inputEmail ?? string.Empty;
            string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex re = new Regex(strRegex);
            if (re.IsMatch(inputEmail))
                return (true);
            else
                return (false);
        }


        public bool IsValidPhone(string Phone)
        {
            try
            {
                if (string.IsNullOrEmpty(Phone))
                    return false;
                var r = new Regex(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$");
                return r.IsMatch(Phone);

            }
            catch (Exception)
            {
                throw;
            }
        }


        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (gh == null)
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }


        [HttpPost]
        public IActionResult AddToCart(int productID, int? amount)
        {
            List<CartItem> gioHang = GioHang;

            CartItem item = gioHang.SingleOrDefault(p => p.product.ProductId == productID);
            if (item == null) // ton tai san pham
            {
                Product productCart = _context.Products.SingleOrDefault(p => p.ProductId == productID);
                item = new CartItem
                {
                    amount = amount.HasValue ? amount.Value : 1,
                    product = productCart
                };
                gioHang.Add(item);
            }
            else
            {
                if (amount.HasValue)
                {
                    item.amount += amount.Value;
                }
                else
                {
                    item.amount++;
                }

            }
            HttpContext.Session.Set<List<CartItem>>("GioHang", gioHang);
            _notifyService.Success("Added success!");
            return RedirectToAction("Details", "Product", new { id = productID });
        }


        [HttpPost]
        public IActionResult Update(int productID, int? amount)
        {
            List<CartItem> gioHang = GioHang;
            CartItem item = gioHang.SingleOrDefault(p => p.product.ProductId == productID);
            if(item != null)
            {
                if (amount.HasValue)
                {
                    item.amount = amount.Value;
                }
            }
            HttpContext.Session.Set<List<CartItem>>("GioHang", gioHang);
            _notifyService.Success("Updated success!");
            return RedirectToAction("Index", "ShoppingCart");
        }


        public IActionResult Remove(int productID)
        {
            List<CartItem> gioHang = GioHang;
            CartItem item = gioHang.SingleOrDefault(p => p.product.ProductId == productID);
            if (item != null)
            {
                gioHang.Remove(item);
            }
            HttpContext.Session.Set<List<CartItem>>("GioHang", gioHang);
            _notifyService.Success("Removed success");
            return RedirectToAction("Index", "ShoppingCart");
        }



        public IActionResult Index()
        {

            List<int> IsProductIDs = new List<int>();
            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }


        public IActionResult CheckOut()
        {
            List<CartItem> gioHang = GioHang;
            uint SumTotal = 0;
            foreach(var item in gioHang)
            {
                SumTotal += item.TotalPrice;
            }
            ViewBag.SumTotal = (uint)SumTotal;    

            List<int> IsProductIDs = new List<int>();
            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }



        public IActionResult DoOrder(string name,string address, string phoneNumber, string email,string note)
		{
            if(name != null && address != null && phoneNumber != null && email != null)
            {
                if (!isEmail(email))
                {
                    _notifyService.Error("Email wrong form");
                    return RedirectToAction("CheckOut", "ShoppingCart");
                }else if (IsValidPhone(phoneNumber))
                {
                    _notifyService.Error("PhoneNumber must be 10 digit");
                    return RedirectToAction("CheckOut", "ShoppingCart");
                }
                else
                {
                    List<CartItem> gioHang = GioHang;
                    Order order = new Order
                    {
                        CustomerName = name,
                        OrderDate = DateTime.Now,
                        StatusId = 4,
                        Address = address,
                        PhoneNumber = phoneNumber,
                        Email = email,
                        Note = note,
                    };
                    _context.Orders.Add(order);
                    _context.SaveChanges();
                    foreach (var item in gioHang)
                    {
                        OrderDetail detail = new OrderDetail
                        {
                            OrderId = order.OrderId,
                            ProductId = item.product.ProductId,
                            Quantity = item.amount,
                            Price = (int)item.TotalPrice
                        };
                        _context.OrderDetails.Add(detail);
                        _context.SaveChanges();
                    }
                    HttpContext.Session.Set<List<CartItem>>("GioHang", null);
                    _notifyService.Success("Order success");
                }
            }
            else
            {
                _notifyService.Error("Please enter full your information");
                return RedirectToAction("CheckOut", "ShoppingCart");
            }

            List<int> IsProductIDs = new List<int>();
            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return RedirectToAction("CheckOut", "ShoppingCart");
		}
    }
}