using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class Product
    {
        public Product()
        {
            Bills = new HashSet<Bill>();
            ProductsImages = new HashSet<ProductsImage>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int BrandId { get; set; }
        public int CategoryId { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public string Description { get; set; }
        public byte[] MainImage { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<Bill> Bills { get; set; }
        public virtual ICollection<ProductsImage> ProductsImages { get; set; }
    }
}
