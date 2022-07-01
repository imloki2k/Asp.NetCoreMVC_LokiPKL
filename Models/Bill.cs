using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class Bill
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public long TotalPrice { get; set; }

        public virtual Product Product { get; set; }
        public virtual Order Order { get; set; }
    }
}
