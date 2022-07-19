using LokiPKL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        public IActionResult Index()
        {
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }
        public IActionResult Details (int id)
        {
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;

            var product = _context.Products
                .Include(x => x.Category)
                .Include(x => x.Brand)
                .FirstOrDefault(x => x.ProductId == id);
            if(product == null)
            {
                return NotFound();
            }
            return View(product);
        }
    }
}
