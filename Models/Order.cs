using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class Order
    {
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public int Status { get; set; }
        public int UserId { get; set; }

        public virtual Bill OrderNavigation { get; set; }
        public virtual User User { get; set; }
    }
}
