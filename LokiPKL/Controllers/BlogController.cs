using Microsoft.AspNetCore.Mvc;

namespace LokiPKL.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
