using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class Blog
    {
        public int BlogId { get; set; }
        public string BlogContent { get; set; }
        public string BlogImage { get; set; }
        public string BlogTitle { get; set; }
    }
}
