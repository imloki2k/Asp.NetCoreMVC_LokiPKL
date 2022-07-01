using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class ProductsImage
    {
        public int ImageId { get; set; }
        public byte[] ImageUrl { get; set; }
        public int ProductId { get; set; }

        public virtual Product Product { get; set; }
    }
}
