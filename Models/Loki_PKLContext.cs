using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

#nullable disable

namespace LokiPKL.Models
{
    public partial class Loki_PKLContext : DbContext
    {
        public Loki_PKLContext()
        {
        }

        public Loki_PKLContext(DbContextOptions<Loki_PKLContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Bill> Bills { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductsImage> ProductsImages { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(config.GetConnectionString("Loki_PKLConStr"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Bill>(entity =>
            {
                entity.HasKey(e => e.OrderId);

                entity.Property(e => e.OrderId)
                    .ValueGeneratedNever()
                    .HasColumnName("order_id");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.TotalPrice).HasColumnName("total_price");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Bills)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bills_Products");
            });

            modelBuilder.Entity<Brand>(entity =>
            {
                entity.Property(e => e.BrandId)
                    .ValueGeneratedNever()
                    .HasColumnName("brand_id");

                entity.Property(e => e.BrandName)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("brand_name")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryId)
                    .ValueGeneratedNever()
                    .HasColumnName("category_id");

                entity.Property(e => e.BrandId).HasColumnName("brand_id");

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("category_name")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.OrderId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("order_id");

                entity.Property(e => e.OrderDate)
                    .HasColumnType("datetime")
                    .HasColumnName("order_date");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.OrderNavigation)
                    .WithOne(p => p.Order)
                    .HasForeignKey<Order>(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Orders_Bills");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Orders_Users");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.BrandId).HasColumnName("brand_id");

                entity.Property(e => e.CategoryId).HasColumnName("category_id");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnType("ntext")
                    .HasColumnName("description");

                entity.Property(e => e.MainImage)
                    .IsRequired()
                    .HasColumnType("image")
                    .HasColumnName("main_image");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("product_name")
                    .IsFixedLength(true);

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.BrandId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Products_Brands");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Products_Categories");
            });

            modelBuilder.Entity<ProductsImage>(entity =>
            {
                entity.HasKey(e => e.ImageId);

                entity.ToTable("Products_Images");

                entity.Property(e => e.ImageId).HasColumnName("image_id");

                entity.Property(e => e.ImageUrl)
                    .IsRequired()
                    .HasColumnType("image")
                    .HasColumnName("image_url");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductsImages)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Products_Images_Products");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId)
                    .ValueGeneratedNever()
                    .HasColumnName("role_id");

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("role_name")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(500)
                    .HasColumnName("address");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("email")
                    .IsFixedLength(true);

                entity.Property(e => e.Fullname)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("fullname");

                entity.Property(e => e.NumberPhone).HasColumnName("number_phone");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("password")
                    .IsFixedLength(true);

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("user_name")
                    .IsFixedLength(true);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_Roles");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
