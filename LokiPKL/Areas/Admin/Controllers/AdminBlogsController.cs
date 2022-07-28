using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LokiPKL.Models;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using LokiPKL.Helpper;

namespace LokiPKL.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminBlogsController : Controller
    {
        private readonly Loki_PKLContext _context;
        public INotyfService _notifyService { get; }

        public AdminBlogsController(Loki_PKLContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        // GET: Admin/AdminBlogs
        public async Task<IActionResult> Index()
        {
            return View(await _context.Blogs.ToListAsync());
        }

        // GET: Admin/AdminBlogs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs
                .FirstOrDefaultAsync(m => m.BlogId == id);
            if (blog == null)
            {
                return NotFound();
            }

            return View(blog);
        }

        // GET: Admin/AdminBlogs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminBlogs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BlogId,BlogContent,BlogImage,BlogTitle")] Blog blog, Microsoft.AspNetCore.Http.IFormFile fBlogImage)
        {
            if (ModelState.IsValid)
            {
                if (fBlogImage != null)
                {
                    blog.BlogImage = await Utilities.UploadFile(fBlogImage, @"Blog", fBlogImage.FileName.ToLower());
                }
                if (string.IsNullOrEmpty(blog.BlogImage)) blog.BlogImage = "default.jpg";
                _context.Add(blog);
                await _context.SaveChangesAsync();
                _notifyService.Success("Add new Blog successful!");
                return RedirectToAction(nameof(Index));
            }
            return View(blog);
        }

        // GET: Admin/AdminBlogs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }
            return View(blog);
        }

        // POST: Admin/AdminBlogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BlogId,BlogContent,BlogImage,BlogTitle")] Blog blog, Microsoft.AspNetCore.Http.IFormFile fBlogImage)
        {
            if (id != blog.BlogId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (fBlogImage != null)
                    {
                        blog.BlogImage = await Utilities.UploadFile(fBlogImage, @"Blog", fBlogImage.FileName.ToLower());
                    }
                    if (string.IsNullOrEmpty(blog.BlogImage)) blog.BlogImage = "default.jpg";
                    _context.Update(blog);
                    await _context.SaveChangesAsync();
                    _notifyService.Success("Edit successful!");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BlogExists(blog.BlogId))
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
            return View(blog);
        }

        // GET: Admin/AdminBlogs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs
                .FirstOrDefaultAsync(m => m.BlogId == id);
            if (blog == null)
            {
                return NotFound();
            }

            return View(blog);
        }

        // POST: Admin/AdminBlogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var blog = await _context.Blogs.FindAsync(id);
            _context.Blogs.Remove(blog);
            await _context.SaveChangesAsync();
            _notifyService.Success("Delete successful!");
            return RedirectToAction(nameof(Index));
        }

        private bool BlogExists(int id)
        {
            return _context.Blogs.Any(e => e.BlogId == id);
        }
    }
}
