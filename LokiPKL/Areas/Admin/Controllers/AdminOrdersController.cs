using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LokiPKL.Models;
using AspNetCoreHero.ToastNotification.Abstractions;
using PagedList.Core;
using Microsoft.AspNetCore.Http;

namespace LokiPKL.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminOrdersController : Controller
    {
        private readonly Loki_PKLContext _context;

        public INotyfService _notifyService { get; }


        public AdminOrdersController(Loki_PKLContext context, INotyfService notifyService)
        {
            _notifyService = notifyService;
            _context = context;
        }

        // GET: Admin/AdminOrders
        public IActionResult Index(int? page)
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;
            var IsOrders = _context.Orders
                .Include(x => x.User)
                .Include(x => x.Status)
                .AsNoTracking()
                .OrderByDescending(x => x.OrderDate);

            PagedList<Order> models = new PagedList<Order>(IsOrders, pageNumber, pageSize);

            ViewBag.CurrentPage = pageNumber;
            return View(models);
        }

        // GET: Admin/AdminOrders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            List<OrderDetail> orderDetails = _context.OrderDetails.Where(o => o.OrderId == id).ToList();
            List<Product> products = new List<Product>();
            if (orderDetails != null)
            {
                foreach(var o in orderDetails)
                {
                    Product product = (Product)_context.Products.FirstOrDefault(p => p.ProductId == o.ProductId);
                    products.Add(product);
                }
            }
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(o => o.Status)
                .Include(o => o.User)
                .Include(o => o.OrderDetails)
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null)
            {
                return NotFound();
            }
            ViewBag.Products = products;
            ViewBag.OrderDetails = orderDetails;
            return View(order);
        }

        // GET: Admin/AdminOrders/Create
        public IActionResult Create()
        {
            ViewData["StatusId"] = new SelectList(_context.OrderStatuses, "StatusId", "StatusContent");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Address");
            return View();
        }

        // POST: Admin/AdminOrders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderId,OrderDate,StatusId,UserId")] Order order)
        {
            if (ModelState.IsValid)
            {
                _context.Add(order);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["StatusId"] = new SelectList(_context.OrderStatuses, "StatusId", "StatusContent", order.StatusId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Address", order.UserId);
            return View(order);
        }

        // GET: Admin/AdminOrders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(x => x.User)
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null)
            {
                return NotFound();
            }
            ViewData["StatusId"] = new SelectList(_context.OrderStatuses, "StatusId", "StatusContent", order.StatusId);
            var address = order.User.Address;
            ViewBag.Address = address;
            return View(order);
        }

        // POST: Admin/AdminOrders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,OrderDate,StatusId,UserId")] Order order)
        {
            string newAddress = Request.Form["address"];
            if (id != order.OrderId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(order);
                    await _context.SaveChangesAsync();
                    User u = order.User;
                    if (u != null)
                    {
                        u.Address = newAddress;
                        _context.Update(u);
                        _context.SaveChanges();
                    }
                    _notifyService.Success("Edit successful!");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderExists(order.OrderId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["StatusId"] = new SelectList(_context.OrderStatuses, "StatusId", "StatusContent", order.StatusId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Address", order.UserId);
            return View(order);
        }

        // GET: Admin/AdminOrders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            List<OrderDetail> orderDetails = _context.OrderDetails.Where(o => o.OrderId == id).ToList();
            List<Product> products = new List<Product>();
            if (orderDetails != null)
            {
                foreach (var o in orderDetails)
                {
                    Product product = (Product)_context.Products.FirstOrDefault(p => p.ProductId == o.ProductId);
                    products.Add(product);
                }
            }
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(o => o.Status)
                .Include(o => o.User)
                .Include(o => o.OrderDetails)
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null)
            {
                return NotFound();
            }
            ViewBag.Products = products;
            ViewBag.OrderDetails = orderDetails;
            return View(order);
        }

        // POST: Admin/AdminOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var order = await _context.Orders.FindAsync(id);
            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();
            _notifyService.Success("Delete successful!");
            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _context.Orders.Any(e => e.OrderId == id);
        }
    }
}
