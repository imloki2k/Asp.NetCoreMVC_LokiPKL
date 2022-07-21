using LokiPKL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using System.Collections.Generic;
using System.Linq;

namespace LokiPKL.Controllers
{
    public class ProductController : Controller
    {
        private readonly Loki_PKLContext _context;

        public ProductController(Loki_PKLContext context)
        {
            _context = context;
        }

        public IActionResult Index(int? page, int id)
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 12;
            if(id == 0)
            {
                var IsProducts = _context.Products.AsNoTracking()
                .OrderBy(x => x.ProductId);
                PagedList<Product> models = new PagedList<Product>(IsProducts, pageNumber, pageSize);
                ViewBag.CurrentPage = pageNumber;

                List<Brand> brands = _context.Brands.ToList();
                List<Category> categories = _context.Categories.ToList();
                ViewBag.Brands = brands;
                ViewBag.Categories = categories;
                return View(models);
            }
            else
            {
                var IsProducts = _context.Products.AsNoTracking()
                    .Where(x => x.CategoryId == id)
                    .OrderBy(x => x.ProductId);
                PagedList<Product> models = new PagedList<Product>(IsProducts, pageNumber, pageSize);
                ViewBag.CurrentPage = pageNumber;

                List<Brand> brands = _context.Brands.ToList();
                List<Category> categories = _context.Categories.ToList();
                ViewBag.Brands = brands;
                ViewBag.Categories = categories;
                return View(models);
            }
        }


        public IActionResult Details(int id)
        {
            var product = _context.Products
                .Include(x => x.Category)
                .Include(x => x.Brand)
                .FirstOrDefault(x => x.ProductId == id);
            if(product == null)
            {
                return NotFound();
            }
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View(product);
        }
    }
}
