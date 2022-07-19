using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class OrderDetail
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }


        public string FormatPrice => this.Price.ToString("#,## VNĐ");

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
