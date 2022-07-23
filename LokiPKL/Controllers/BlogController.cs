using LokiPKL.Extensions;
using LokiPKL.Models;
using LokiPKL.ModelViews;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
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

        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }

        public IActionResult Index(int? page)
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 12;
            var IsBlogs = _context.Blogs.AsNoTracking()
                .OrderByDescending(x => x.BlogId);
            PagedList<Blog> models = new PagedList<Blog>(IsBlogs, pageNumber, pageSize);
            ViewBag.CurrentPage = pageNumber;

            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View(models);
        }

        public IActionResult SingleBlog(int? id)
        {
            var blogs = _context.Blogs.SingleOrDefault(x => x.BlogId == id);
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
            return View(blogs);
        }
    }
}
