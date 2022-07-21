using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class User
    {
        public User()
        {
            Orders = new HashSet<Order>();
        }

        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string NumberPhone { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }


        public virtual Role Role { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
