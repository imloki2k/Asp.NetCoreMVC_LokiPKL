using System;
using System.Collections.Generic;

#nullable disable

namespace LokiPKL.Models
{
    public partial class Contact
    {
        public int ContactId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Message { get; set; }

        public Contact(string name, string address, string phoneNumber, string message)
        {
            Name = name;
            Address = address;
            PhoneNumber = phoneNumber;
            Message = message;
        }
    }
}
