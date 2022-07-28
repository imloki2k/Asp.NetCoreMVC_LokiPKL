using LokiPKL.Models;

namespace LokiPKL.ModelViews
{
    public class CartItem
    {
        public Product product { get; set; }
        public int amount { get; set; }

        public uint TotalPrice => (uint)(amount * product.Price);

        public string FormatTotalPrice => this.TotalPrice.ToString("#,##.00 VNĐ");

    }
}
