using AspNetCoreHero.ToastNotification.Abstractions;
using LokiPKL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace LokiPKL.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly Loki_PKLContext _context;

        public INotyfService _notifyService { get; }

        public HomeController(ILogger<HomeController> logger, Loki_PKLContext context,INotyfService notifyService)
        {
            _logger = logger;
            _context = context;
            _notifyService = notifyService;
        }

        public IActionResult Index()
        {
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Contact()
        {
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }

        public IActionResult DoContact()
        {
            string name = Request.Form["name"];
            string address = Request.Form["address"];
            string phone = Request.Form["phone"];
            string mess = Request.Form["message"];
            Contact c = new Contact(name,address,phone,mess);
            _context.Contacts.Add(c);
            _context.SaveChanges();
            _notifyService.Success("Send message successful!");
            return RedirectToAction("Contact");
        }

        public IActionResult About()
        {
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
