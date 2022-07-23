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
using System.Text.RegularExpressions;

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

            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
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
                if (isEmail(_user.UserName))
                {
                    if (_user.Password.Length >= 6)
                    {
                        var f_password = EncodingMD5.GetMD5(_user.Password);
                        var user = _context.Users
                            .Include(u => u.Role)
                            .SingleOrDefault(s => s.Email.Equals(_user.UserName) && s.Password.Equals(f_password));
                        if (user != null)
                        {
                            //add session
                            HttpContext.Session.SetString("UserId", user.UserId.ToString());
                            var UserId = HttpContext.Session.GetString("UserId");
                            _notifyService.Success("Login successful!");

                            //identity
                            var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Role, user.Role.RoleName.Trim().ToString()),
                        new Claim(ClaimTypes.Name, user.Fullname),
                        new Claim("UserId", user.UserId.ToString()),
                    };
                            ClaimsIdentity identity = new ClaimsIdentity(claims, "login");
                            ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                            await HttpContext.SignInAsync(principal);
                            HttpContext.Session.Set<List<CartItem>>("GioHang", null);
                            return RedirectToAction("Index", "Home");
                        }
                        else
                        {
                            ViewBag.Error = "Login failed";
                            _notifyService.Error("Wrong email or password");
                            return RedirectToAction("Login", "Accounts");
                        }
                    }
                    else
                    {
                        _notifyService.Error("Password must more than 6 digits ơr letters");
                        return RedirectToAction("Login", "Accounts");
                    }
                }
                else
                {
                    ViewBag.Error = "Login failed";
                    _notifyService.Error("Email wrong format");
                    return RedirectToAction("Login", "Accounts");
                }

            }
            else
            {
                _notifyService.Error("Please enter email and password");
                return RedirectToAction("Login", "Accounts");
            }
            return View();
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Register.html", Name = "Register")]
        public IActionResult Register()
        {
            var IsGioHang = GioHang;
            ViewBag.IsGioHang = IsGioHang;
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
                        _notifyService.Error("Confirm password wrong");
                        return RedirectToAction("Register", "Accounts");
                    }
                    else if (!isEmail(newUser.Email))
                    {
                        _notifyService.Error("Email wrong format");
                        return RedirectToAction("Register", "Accounts");
                    }
                    else if(IsValidPhone(newUser.PhoneNumber) == false)
                    {
                        _notifyService.Error("PhoneNumber wrong format");
                        return RedirectToAction("Register", "Accounts");
                    }else if(newUser.Password.ToString().Length < 6)
                    {
                        _notifyService.Error("Password must more than 6 digits ơr letters");
                        return RedirectToAction("Register", "Accounts");
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
                            RoleId = 2,
                            Role = _context.Roles.SingleOrDefault(x => x.RoleId == 2),
                        };
                        _context.Add(user);
                        await _context.SaveChangesAsync();
                        _notifyService.Success("Register successful!");

                        //add session
                        HttpContext.Session.SetString("UserId", user.UserId.ToString());

                        //identity
                        var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Role, user.Role.RoleName.Trim().ToString()),
                        new Claim(ClaimTypes.Name, user.Fullname),
                        new Claim("UserId", user.UserId.ToString()),
                    };
                        ClaimsIdentity identity = new ClaimsIdentity(claims, "login");
                        ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                        await HttpContext.SignInAsync(principal);
                        HttpContext.Session.Set<List<CartItem>>("GioHang", null);
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.Error = "Email or phone number is already exists";
                    _notifyService.Error("Email or phone number is already exists");
                    return RedirectToAction("Register", "Accounts");
                }


            }
            else
            {
                _notifyService.Error("Please enter full information");
                return RedirectToAction("Register", "Accounts");
            }
            return RedirectToAction("Register", "Accounts");
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
                    var IsGioHang = GioHang;
                    ViewBag.IsGioHang = IsGioHang;
                    List<Brand> brands = _context.Brands.ToList();
                    List<Category> categories = _context.Categories.ToList();
                    ViewBag.Brands = brands;
                    ViewBag.Categories = categories;
                    return View(customer);
                }
                return RedirectToAction("Login", "Accounts");
            }

            return View();
        }


        public IActionResult ChangePassword(string OldPassword, string NewPassword)
        {
            var uID = HttpContext.Session.GetString("UserId");
            var user = _context.Users.AsNoTracking().SingleOrDefault(u => u.UserId == Convert.ToInt32(uID));
            var f_password = EncodingMD5.GetMD5(OldPassword);
            if(user.Password.Trim().Equals(f_password.ToString()))
            {
                if (NewPassword.Length < 6)
                {
                    _notifyService.Error("NewPassword must more than 6 digits ơr letters");
                    RedirectToAction("Dashboard", "Accounts");
                }
                else
                {
                    user.Password = EncodingMD5.GetMD5(NewPassword);
                    _context.Update(user);
                    _context.SaveChangesAsync();
                    _notifyService.Success("Change Password successful!");
                    RedirectToAction("Dashboard", "Accounts");
                }
            }
            else
            {
                _notifyService.Error("OldPassword incorrect!");
                RedirectToAction("Dashboard", "Accounts");
            }
            return RedirectToAction("Dashboard", "Accounts");
        }
    }
}
