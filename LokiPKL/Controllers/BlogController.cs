using LokiPKL.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace LokiPKL.Controllers
{
    public class BlogController : Controller
    {
        private readonly Loki_PKLContext _context;

        public BlogController(Loki_PKLContext context)
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
    }
}
