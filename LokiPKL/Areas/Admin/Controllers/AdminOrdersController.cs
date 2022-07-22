using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LokiPKL.Models;
using PagedList.Core;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace LokiPKL.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminOrdersController : Controller
    {
        private readonly Loki_PKLContext _context;

        public INotyfService _notifyService { get; }

        public AdminOrdersController(Loki_PKLContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        // GET: Admin/AdminOrders
        public IActionResult Index(int? page)
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;
            var IsOrders = _context.Orders.AsNoTracking()
                .Include(o => o.Status)
                .OrderBy(x => x.OrderDate);

            PagedList<Order> models = new PagedList<Order>(IsOrders, pageNumber, pageSize);

            ViewBag.CurrentPage = pageNumber;
            return View(models);
        }

        // GET: Admin/AdminOrders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var order_details = _context.OrderDetails
                .Include(o => o.Product)
                .Where(x => x.OrderId == id)
                .ToList();
            ViewBag.Order_Details = order_details;

            var order = await _context.Orders
                .Include(o => o.Status)
                .Include(o => o.User)
                .Include(o => o.OrderDetails)
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null)
            {
                return NotFound();
            }

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
        public async Task<IActionResult> Create([Bind("OrderId,OrderDate,StatusId,UserId,CustomerName,Address,PhoneNumber,Email,Note")] Order order)
        {
            if (ModelState.IsValid)
            {
                _context.Add(order);
                await _context.SaveChangesAsync();
                _notifyService.Success("Add new Order successful!");
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

            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            ViewData["StatusId"] = new SelectList(_context.OrderStatuses, "StatusId", "StatusContent", order.StatusId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Address", order.UserId);
            return View(order);
        }

        // POST: Admin/AdminOrders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,OrderDate,StatusId,UserId,CustomerName,Address,PhoneNumber,Email,Note")] Order order)
        {
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
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(o => o.Status)
                .Include(o => o.User)
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null)
            {
                return NotFound();
            }

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
