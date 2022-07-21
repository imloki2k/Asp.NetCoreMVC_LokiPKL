using LokiPKL.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using LokiPKL.Extensions;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using LokiPKL.ModelViews;
using Microsoft.EntityFrameworkCore;
using System;

namespace LokiPKL.Controllers
{
    [Authorize]
    public class AccountsController : Controller
    {
        private readonly Loki_PKLContext _context;
        public INotyfService _notifyService { get; }

        public AccountsController(Loki_PKLContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        

        [HttpGet]
        [AllowAnonymous]
        [Route("Login.html",Name = "Login")]
        public IActionResult Login(string returnUrl = null)
        {
            var tkID = HttpContext.Session.GetString("UserId");
            if(tkID != null)
            {
                return RedirectToAction("Dashboard","Accounts");
            }
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("Login.html", Name = "Login")]
        public async Task<IActionResult> Login(LoginModelView _user, string returnUrl = null)
        {
            if (ModelState.IsValid)
            {
                var f_password = EncodingMD5.GetMD5(_user.Password);
                var user = _context.Users.SingleOrDefault(s => s.Email.Equals(_user.UserName) && s.Password.Equals(f_password));
                if (user != null)
                {
                    //add session
                    HttpContext.Session.SetString("UserId", user.UserId.ToString());
                    _notifyService.Success("Login successful!");
                    
                    //identity
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.Fullname),
                        new Claim("UserId", user.UserId.ToString()),
                    };
                    ClaimsIdentity identity = new ClaimsIdentity(claims, "login");
                    ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                    await HttpContext.SignInAsync(principal);
                    return RedirectToAction("Index","Home");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Index","Accounts");
                }
            }
            return View();
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Register.html", Name = "Register")]
        public IActionResult Register()
        {
            List<Brand> brands = _context.Brands.ToList();
            List<Category> categories = _context.Categories.ToList();
            ViewBag.Brands = brands;
            ViewBag.Categories = categories;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("Register.html", Name = "Register")]
        public async Task<IActionResult> Register(RegisterModelView newUser)
        {
            if (ModelState.IsValid)
            {
                var check = _context.Users.FirstOrDefault(s => s.Email == newUser.Email || s.NumberPhone == newUser.PhoneNumber);
                if (check == null)
                {
                    if(newUser.Password != newUser.ConfirmPassword)
                    {
                        _notifyService.Error("Confirm password wrong!");
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        User user = new User
                        {
                            Fullname = newUser.FullName,
                            Email = newUser.Email,
                            NumberPhone = newUser.PhoneNumber,
                            Password = EncodingMD5.GetMD5(newUser.Password),
                            UserName = newUser.FullName.Trim(),
                            RoleId = 2
                        };
                        _context.Add(user);
                        await _context.SaveChangesAsync();
                        _notifyService.Success("Register successful!");

                        //add session
                        HttpContext.Session.SetString("UserId",user.UserId.ToString());

                        //identity
                        var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.Fullname),
                        new Claim("UserId", user.UserId.ToString()),
                    };
                        ClaimsIdentity identity = new ClaimsIdentity(claims, "login");
                        ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                        await HttpContext.SignInAsync(principal);
                        return RedirectToAction("Dashboard", "Accounts");
                    }
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return RedirectToAction("Index", "Accounts");
                }


            }
            return RedirectToAction("Index", "Accounts");
        }

        [HttpGet]
        [Route("Logout.html",Name = "Logout")]
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();//remove session
            HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }


        [Route("Dashboard.html", Name = "DashBoard")]
        public IActionResult DashBoard()
        {
            var tkID = HttpContext.Session.GetString("UserId");
            if (tkID != null)
            {
                var customer = _context.Users.AsNoTracking().SingleOrDefault(x => x.UserId == Convert.ToInt32(tkID));
                if(customer != null)
                {
                    return View(customer);
                }    
            }

            return RedirectToAction("Login", "Accounts");
        }
    }
}
