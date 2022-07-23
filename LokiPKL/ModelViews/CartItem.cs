using LokiPKL.Models;

namespace LokiPKL.ModelViews
{
    public class CartItem
    {
        public Product product { get; set; }
        public int amount { get; set; }

        public double TotalPrice => amount * product.Price;

        public string FormatTotalPrice => this.TotalPrice.ToString("#,##0.00 VNĐ");

    }
}
