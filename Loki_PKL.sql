USE [master]
GO
/****** Object:  Database [Loki_PKL]    Script Date: 7/28/2022 5:32:09 PM ******/
CREATE DATABASE [Loki_PKL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Loki_PKL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOKI\MSSQL\DATA\Loki_PKL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Loki_PKL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOKI\MSSQL\DATA\Loki_PKL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Loki_PKL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Loki_PKL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Loki_PKL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Loki_PKL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Loki_PKL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Loki_PKL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Loki_PKL] SET ARITHABORT OFF 
GO
ALTER DATABASE [Loki_PKL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Loki_PKL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Loki_PKL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Loki_PKL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Loki_PKL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Loki_PKL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Loki_PKL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Loki_PKL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Loki_PKL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Loki_PKL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Loki_PKL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Loki_PKL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Loki_PKL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Loki_PKL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Loki_PKL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Loki_PKL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Loki_PKL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Loki_PKL] SET RECOVERY FULL 
GO
ALTER DATABASE [Loki_PKL] SET  MULTI_USER 
GO
ALTER DATABASE [Loki_PKL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Loki_PKL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Loki_PKL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Loki_PKL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Loki_PKL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Loki_PKL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Loki_PKL', N'ON'
GO
ALTER DATABASE [Loki_PKL] SET QUERY_STORE = OFF
GO
USE [Loki_PKL]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_content] [nvarchar](max) NULL,
	[blog_image] [nchar](150) NOT NULL,
	[blog_title] [nvarchar](500) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nchar](150) NOT NULL,
	[brand_id] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[phone_number] [nchar](10) NOT NULL,
	[message] [text] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[customer_name] [nvarchar](150) NULL,
	[address] [nvarchar](500) NULL,
	[phone_number] [nchar](10) NULL,
	[email] [nchar](150) NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[status_id] [int] NOT NULL,
	[status_content] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Images]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Images](
	[image_id] [int] NOT NULL,
	[image] [nvarchar](150) NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Images] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nchar](150) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [ntext] NOT NULL,
	[main_image] [nvarchar](150) NULL,
	[hot_product] [bit] NULL,
	[featured_product] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] NOT NULL,
	[role_name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/28/2022 5:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nchar](150) NOT NULL,
	[fullname] [nvarchar](150) NOT NULL,
	[email] [nchar](150) NOT NULL,
	[number_phone] [nchar](10) NULL,
	[password] [nchar](500) NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blog_id], [blog_content], [blog_image], [blog_title]) VALUES (1, N'Honda CB1000R 2018 chốt giá 485 triệu đồng với ngoại hình mới pha trộn giữa nét hiện đại và cổ điển. Chiếc naked siêu xe CB1000R khẳng định số 1 siêu xe dòng naked trong suốt gần 10 năm qua với 30 phiên bản bao gồm Scrambler, Café racer, naked retro… Cb1000R gây sốt toàn cầu và nhận được sự săn đón của giới yêu xe bởi kiểu dáng retro, đẳng cấp cao, tốc độ cao và động cơ mạnh mẽ, bền bỉ.Honda CB1000R 2018 chốt giá 485 triệu đồng.
Honda là thương hiệu để lại trong lòng người hâm mộ dòng xe này bởi sự vận hành bền bỉ của động cơ Honda CB1000R 2018 chốt giá 485 triệu đồng không còn là cái tên xa lạ khi để lại ấn tượng không chỉ ở khối động cơ mà còn là sự chiếc siêu xe dòng naked thêm vào đó là công nghệ hiện đại đáp ứng nhu cầu ngày đổi mới của các dòng xe. Cb1000R có thiết kế ngoại hình pha lẫn nét hiện đại với đường nét góc cạnh với đầu đèn dạng tròn cổ điển được kết hợp với hai cụm đồng hồ tròn. Trong gần 10 năm qua, đuôi xe của chiếc naked siêu xe vuốt cao đã được thiết kế gọn gàng và hiện đại hơn. CB1000R với kiểu dáng hoàn toàn mới khẳng định số 1 siêu xe dòng naked trong suốt gần 10 năm còn được trang bị cặp phuộc upside down đẹp mắt và ABS tiêu chuẩn mặc định. Điểm ấn tượng nhất mà chiếc Cb1000R chính là pat biển số kết hợp với dè chắn bùn đồng thời còn có tích hợp sẵn 2 đèn xinhan.
Honda CB1000R 2018 chốt giá 485 triệu đồng trở lại sau gần 10 năm và khẳng định số 1 siêu xe dòng naked bởi chiếc naked siêu xe này được honda trang bị thêm các công nghệ hiện đại để phục vụ nhu cầu sử dụng của người yêu xe. Một trong những thay đổi là việc sử dụng pit tông mới, thiết kế lại buồng đốt, trục cam được nâng cao cũng như kích thước van nạp và van xả lớn hơn.Honda CB1000R 2018 chốt giá 485 triệu đồng, sở khối động cơ 4 xy lanh thẳng hàng, dung tích 998 phân khối. Bên cạnh đó, chiếc naked siêu xe này còn sử dụng công nghệ bướm ga điện tử giúp người điều khiển có thể lựa chọn được 4 chế độ lái tùy thích. Đặc biệt là chế độ cá nhân giúp người lái điều chỉnh mức độ can thiệp theo ý muốn. Mỗi chế độ lái đều có tác động đến công suất, phanh động cơ và cả momen xoắn
Chiếc Honda CB1000R 2018 khẳng định số 1 siêu xe dòng naked trong suốt gần 10 năm được đánh giá là mẫu xe tạo sự khác biệt về kiểu dáng đẳng cấp cao so với dòng xe khác. Honda CB1000R 2018 chốt giá 485 triệu đồng mang thiết kế vừa cổ điển nhưng vẫn rất hiện đại, thiết kế bên ngoài được thay đổi hoàn toàn đồng thời Cb1000R còn được trang bị các công nghệ mới. CB1000R là đối thủ đáng gờm của các mẫu nakedbike trong phân khúc 1000 phân khối và được lòng người yêu xe bởi động cơ vận hành mạnh mẽ và bền bỉ. Chiếc naked siêu xe Cb1000R hiện được Motorrock phân phối chính hãng với chất lượng tốt nhất cũng như giá cả cạnh tranh nhất.', N'Honda-CB1000R-2018.jpg                                                                                                                                ', N'Honda CB1000R khẳng định số 1 siêu moto dòng naked')
INSERT [dbo].[Blog] ([blog_id], [blog_content], [blog_image], [blog_title]) VALUES (2, N'Nếu nhiều anh em yêu thích tốc độ và đặc biệt quan tâm đến MotoGP thì chắc hẳn không còn xa lạ gì với Hộp số liền mạch (Seamless shift gearbox – SSG) đúng không nào. Đây đã là tiêu chuẩn của MotoGP trong 10 năm qua.
Hộp số này có cách thức hoạt động ngược với hộp số được trang bị trên các mẫu xe thương mại. Và một tin vui dành cho các fan của Ducati là hãng này vừa lộ thông tin về việc sẽ mang hệ thống này lên các mẫu xe mô tô được bán ra thị trường.
Năm 2011, hộp số liền mạch được Honda đưa vào sử dụng đầu tiên. Nó đã tạo ra một làn sóng mới cho MotoGP nhưng một phần đông đảo người xem nhận xét hộp số này không đúng luật. Thế nên nó đã được tinh chỉnh để phù hợp các quy định của FIM, về việc cấm sử dụng hộp số ly hợp kép (loại hộp số không cần dùng côn khi chuyển số).Về cách thức hoạt động, từ cái tên “liền mạch” chắc các bạn cũng có thể hiểu. Hộp số này cho phép các bánh răng thay đổi mà không cần sử dụng ly hợp (côn). Nó sẽ tốt hơn so với một hộp số thông thường trong việc tiết kiệm nhiên liệu. Với hộp số thường khi chuyển số, lúc này tốc độ xe giảm thì bộ phận đánh lửa sẽ bị cắt, khi các tay đua mở ga trở lại thì bộ phận đánh lửa phải tái khởi động và làm mất nhiên liệu nhiều hơn.
Đối với hộp số liền mạch, nó có ưu điểm là trong thời gian chuyển số mới thì số cũ vẫn hoạt động, việc này giúp các tay đua có thể kiểm soát hoàn toàn chiếc xe của mình trong lúc tăng hay giảm tốc độ. Nó sẽ tiết kiệm được nhiên liệu và một khoảng thời gian dù rất nhỏ nhưng lại là rất quan trọng trên đường đua.Ở bảng thiết kế của hộp số mới tiết lộ từ Ducati, cấu trúc được hiển thị có thể hơi khác so với cấu trúc được sử dụng trong MotoGP, vì các giải pháp cơ khí chỉ ra rõ ràng việc sử dụng trong hộp truyền động hiện có của động cơ thông thường.
Do đó, nó có thể được sử dụng làm hộp số truyền động trên phiên bản Panigale V4 mới và sau đó là các động cơ mạnh mẽ khác. Ưu điểm lớn nhất là: Bộ truyền động không cần bất kỳ thành phần điện tử hoặc thủy lực nào can thiệp trong quá trình sang số.
Lợi ích cao nhất của nó chính là việc các tay đua vẫn có thể duy trì được tốc độ cao nhất, ngay cả khi chuyển số thì sức mạnh từ động cơ chuyển đến cho xe vẫn không bị ngắt quãng.', N'ducati.jpg                                                                                                                                            ', N'Panigale thế hệ mới sẽ sử dụng bộ số liền mạch từ MotoGP')
INSERT [dbo].[Blog] ([blog_id], [blog_content], [blog_image], [blog_title]) VALUES (3, N'Đội đua Petronas Yamaha Sepang đã gia nhập giải đua MotoGP vào năm 2019. Với Franco Morbidelli, người được bảo trợ của Valentino Rossi và người thừa kế ngai vàng của Marquez là Fabio Quartararo, một đội đua có tương lai tươi sáng phía trước. Đến giữa mùa giải 2021, Quartararo và Morbidelli đều chuyển đến đội Yamaha Factory, rời Petronas SRT, cùng với việc Valentino Rossi đã nghỉ hưu và Andrea Dovizioso trở lại.

Đến những vòng cuối cùng của mùa giải MotoGP 2021, Petronas rút lại sự ủng hộ với đội, khiến Yamaha và ông chủ của đội Razlan Razali phải tranh giành nhà tài trợ danh hiệu mới. Thương hiệu viễn thông WithU của Ý đã nhanh chóng tham gia để giúp thành lập Đội WithU Yamaha RNF.
Vào ngày 24 tháng 1 năm 2022, đội mới đã công bố chiếc Yamaha YZR-M1 của họ với một sự kiện đặc biệt tại Nhà hát Philharmonic ở Verona, Ý.

Tất nhiên, logo WithU và màu sắc thương hiệu sẽ nổi bật trên thân xe, nhưng số tay đua 04 và 40 cũng gây chú ý không kém. Vào năm 2022, Darryn Binder sẽ trở thành tay đua thứ hai vượt qua Moto2, tham gia trực tiếp vào thứ hạng MotoGP từ Moto3.
Anh trai của Binder, Brad Binder, là một tay đua KTM MotoGP kỳ cựu và Yamaha hy vọng sẽ tìm thấy cơ hội chiến thắng cuộc đua tương tự ở người em trai của mình.

Trở lại giải đua xe Grand Prix năm thứ 20, Andrea Dovizioso sắp có một kỳ nghỉ phép sau khi chia tay sau lộn xộn với đội Ducati Factory. Dovi đã trải qua 8 năm với đội Bologna, nhưng trước khi thi đấu tại Desmosedici GP, anh ấy cũng đã giành được vị trí thứ tư ấn tượng trong chức vô địch năm 2012 trên Yamaha YZR-M1 Tech 3.

Tất nhiên, nguyên mẫu của Yamaha đã tiếp tục trong 10 năm qua, nhưng Dovi đang phải đối mặt với thách thức trực tiếp.
', N'blog3.jpeg                                                                                                                                            ', N'Ngắm nhìn YZF-M1 2022 của đội đua WithU Yamaha RNF')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (1, N'HONDA                                                                                                                                                 ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (2, N'KAWASAKI                                                                                                                                              ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (3, N'JAWA                                                                                                                                                  ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (4, N'BOBBER                                                                                                                                                ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (5, N'BMW                                                                                                                                                   ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (6, N'TRIUMPH                                                                                                                                               ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (7, N'SUZUKI                                                                                                                                                ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (8, N'YAMAHA                                                                                                                                                ')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (9, N'DUCATI                                                                                                                                                ')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (1, N'Classics                                                                                                                                              ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (2, N'Naked                                                                                                                                                 ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (3, N'Sport                                                                                                                                                 ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (4, N'Adventure                                                                                                                                             ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (5, N'Cruiser Honda                                                                                                                                         ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (6, N'Touring                                                                                                                                               ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (7, N'Off-Road                                                                                                                                              ', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (8, N'Ninja H2                                                                                                                                              ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (9, N'KLX                                                                                                                                                   ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (10, N'Kawasaki Z                                                                                                                                            ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (11, N'Kawasaki Ninja                                                                                                                                        ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (12, N'Cruiser Kawasaki                                                                                                                                      ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (13, N'Versys                                                                                                                                                ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (14, N'Kawasaki W                                                                                                                                            ', 2)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (17, N'JAWA                                                                                                                                                  ', 3)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (18, N'BOBBER                                                                                                                                                ', 4)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (19, N'BMW                                                                                                                                                   ', 5)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (20, N'TRIUMPH                                                                                                                                               ', 6)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (21, N'SUZUKI                                                                                                                                                ', 7)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (22, N'YAMAHA                                                                                                                                                ', 8)
INSERT [dbo].[Categories] ([category_id], [category_name], [brand_id]) VALUES (23, N'DUCATI                                                                                                                                                ', 9)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([contact_id], [name], [address], [phone_number], [message]) VALUES (1, N'abc', N'Ha Noi', N'0912512561', N'oke')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (6, 1, 1, 500000000)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (6, 2, 1, 185000000)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (9, 6, 2, 1120000000)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (9, 9, 2, 1040000000)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [order_date], [status_id], [user_id], [customer_name], [address], [phone_number], [email], [note]) VALUES (6, CAST(N'2022-07-17T00:00:00.000' AS DateTime), 1, NULL, N'Quang123', N'Ha Noi', N'0967090500', N'user@gmail.com                                                                                                                                        ', N'oke')
INSERT [dbo].[Orders] ([order_id], [order_date], [status_id], [user_id], [customer_name], [address], [phone_number], [email], [note]) VALUES (9, CAST(N'2022-07-24T00:45:31.070' AS DateTime), 2, NULL, N'abc', N'Ha Noi', N'0123456789', N'helloabc@gmail.com                                                                                                                                    ', N'shipping at 5pm')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrderStatus] ([status_id], [status_content]) VALUES (1, N'Đã giao hàng thành công')
INSERT [dbo].[OrderStatus] ([status_id], [status_content]) VALUES (2, N'Đang vận chuyển')
INSERT [dbo].[OrderStatus] ([status_id], [status_content]) VALUES (3, N'Hủy đơn hàng')
INSERT [dbo].[OrderStatus] ([status_id], [status_content]) VALUES (4, N'Đặt hàng thành công')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (1, N'Honda CB1100RS                                                                                                                                        ', 1, 1, 500000000, 99, N'Honda CB1100RS Final edition vẫn trang động cơ 1100cc 4 xi-lanh làm mát bằng không khí. Honda CB1100 RS Final edition vẫn được trang bị bộ lốp 17 inch phía trước và phía sau rộng ở chân và kết hợp bánh xe bằng nhôm đúc nhưng có sơnmàu đồng thay vì màu đen như bản thường.Bộ giảm sốc phía trước quá cao cấp, một bộ giảm xóc phía sau đôi với một bình chứa dầu phụ và một cánh tay đòn bằng nhôm đúc bằng ngang, giúp xe Honda CB1100RS Final edition đạt được một cảm giác xoay nhanh nhẹn và xử lý nhanh nhạy. Ngoài ra, tay lái thấp đã được điều chỉnh để phù hợp với hiệu suất di chuyển, và vị trí yên ngồi được dời nhiều hơn về phía trước tạo cảm giác lái rất thoải mái.', N'honda_cb1100rs.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (2, N'Honda CB350 H''ness 2021                                                                                                                               ', 1, 1, 185000000, 56, N'Honda CB350 H''ness 2021 ở phân khúc 350cc đã có rất nhiều mẫu xe đến từ các nhà sản xuất Nhật Bản đang dần chiếm ưu thế vì mẫu mã cũng như sự tiện ích nhất định. Ấy thế mà trong nền tảng phân khúc 350cc lại thiếu vắng nhiều những mẫu xe cổ điển thế nên Honda đã mạnh dạn ra mắt mẫu xe Honda CB350 H''ness Retro Sport 2021 cổ điển tại thị trường Ấn Độ.Có thể thấy nhiều người đã quá quen thuộc với những thiết kế có tên gọi là Neo Sport từ hãng Honda với sự hiện đại pha lẫn sự cổ điển đầy phá cách. Thế nhưng Honda vẫn có khả năng tạo nên những mẫu xe độc đáo và khác biệt như Honda Honda CB350 H''ness 2021 này đây.', N'honda-cb350-retro-sport.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (3, N'Classic UK250 CBT                                                                                                                                     ', 1, 1, 86000000, 15, N'Model xe này sử dụng động cơ dạng cổ điển Classic UK250 2 xi-lanh, bốn thì, làm mát bằng không khí, cam trên cao, nắp máy và thân mái giải nhiệt bằng gió, 02 xilanh chung 1 pô tạo tiếng kêu rất độc đáo khi chạy trên đường.Xe Classic UK250 sử dụng dòng động cơ cải tiến có cân bằng chống rung hiệu quả. Tỷ số nén trên đầu 9,5: 1.đường kính xylanh (mm) 55 × 53 hành trình piton. với công nghệ động cơ CBT piton lên xiống cùng lúc tạo ra âm thanh rất rền rất phấn kích như dòng Honda rebel 250 của Honda. 
', N'classic-UK250-cbt.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (4, N'CB1100EX 2022 Final Edition                                                                                                                           ', 1, 1, 273000000, 30, N'Honda CB1100EX Final Edition 4 xi-lanh thẳng hàng làm mát bằng gió. Cơ hội cuối cùng để bạn sở hữu nó trước khi Honda kết thúc ngưng sản xuất sau 11 năm.Động cơ CB1100 EX Final Edtion gồm mỗi mảnh xi lanh là một cái vây sâu, được mài mỏng. Nắp đầu xi lanh có đệm,tăng tính cổ điển của dòng động cơ giả nhiệt gió đẵng cấp của Honda vốn dĩ không thể tiếp tục sản xuất trong năm tới. Tinh thần kế thừa động cơ bốn máy làm mát bằng gió của Honda hấp dẫn bạn cả năm giác quan. Những gì được tạo ra từ điều này là một cảm giác gợi cảm trang nhã thay đổi biểu hiện mỗi khi bạn vặn ga và xe lao vút trong gió.', N'cb1100ex-2022-final-edition.jpg', 1, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (5, N'Honda Rebel 250 đời 2015, 2016                                                                                                                       ', 1, 1, 180000000, 12, N'Honda Rebel 300, Honda Rebel 500, đặc biệt làRebel 250 hàng Mỹ đang có bán rất phổ biến tại USA nhưng để tìm được nơi bán Honda rebel Việt nam hàng mới nguyên thùng ở đâu không phải là dễ. Chúng tôi tự hào  là đơn vị chuyên phân phối chính thức dòng moto Rebel 250 các đời tại Việt Nam', N'rebel-250-2016.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (6, N'CB1300SP 2020                                                                                                                                         ', 1, 2, 560000000, 10, N'Honda CB1300SP 2019, một tuyệt phẩm Moto thể thao dòng Nake đầy oai vệ  màu sắc ấn tượng lôi cuốn
Honda CB1300 SUPER Four SP một cải tiến nâng cấp toàn diện không ngừng, mang lại niềm vui cho bạn khi thao sử dụng nó, ngày càng phù hợp hơn tính năng tiêu dùng hữu ích. CB1300 Super Four mới được đặt tên là "SP" trong tên xe, những mẫu xe này sử dụng hệ thống treo qua lại được thiết kế đặc biệt của Mitchean và được trang bị bộ kẹp phanh trước Brembo theo tiêu chuẩn. với cách lựa chọn cẩn thận các bộ phận xung quanh chân và thiết lập tối đa hóa khả năng vận hành của nó, Honda đang theo đuổi một cải tiến chất lượng cao chưa từng có. Ngoài ra, Honda còn thiết kế thêm một màu sắc riêng làm cho  tăng tính thể thao nổi bật với vóc dáng bên ngoài của CB1300SP 2019.', N'cb1300sp.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (8, N'CB1300SF 2020                                                                                                                                         ', 1, 2, 480000000, 11, N'Hona CB1300SF 2020 Kiểu dáng kinh điển dòng Naked, chiết tiết sắc nét quyến rũ
Honda CB1300 Super Four 2020 sử dụng động cơ 4 xi lanh thẳng hàng khiến bạn không khỏi ngạc nhiên với sức manh của khối động cơ 1300cc. CB1300SF 2020 2019 với một sức mạnh áp đảo tin thần & cảm giác mô-men xoắn rất cao trong toàn bộ khu vực tốc độ chạy. Nhờ vào việc thiết kế kết hợp một kiểu dáng mạnh mẽ gắn vào hệ thống treo hiệu suất cao tạo ra hiệu quả kái rất tuyệt. Hơn nữa, CB1300SF 2020 có một kiểu dáng màu sơn, tem phù hợp cho người lớn tuổi sử dụng. CB1300 SUPER FOUR là một trong những xe moto kinh điển trong ở mọi thời điểm lịch sử. Sự hợp nhất của ba yếu tố "kiểm soát", "âm thanh" và " chống rung động" rất tiên tiến tạo nên xe thể thao dòng Naked rất thú vị.', N'cb1300sf.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (9, N'CB1100 2020                                                                                                                                           ', 1, 2, 520000000, 13, N'Có một và chỉ một sự tồn tại, và nó có một ánh sáng sâu sắc.
Honda CB1100 2020 được sinh ra từ 2010 như một giá trị của hương vị của xe Moto để chạy không phải vì tốc độ, mà tập trung Cam kết vẻ đẹp của kiểu dáng bên ngoài, CB1000 2020 sử dụng một động cơ bốn xi-lanh làm mát bằng không khí, và thay đổi ý định của nhà sản xuất cho từng chi tiết linh kiện của xe đặc biệt về chất lượng vẻ đẹp tinh tế kỹ lưỡng. Ngoài ra, trong khi thừa hưởng kiểu dáng gọn gàng, sử dụng bộ giảm âm kép với cảm giác hiện diện, tiếp tục theo đuổi âm thanh ống xả âm thanh pô đặc trưng cho loại động cơ làm mát bằng không khí. Trong quá trình chuyển đổi giữa sự ra đời và tiến hóa của dòng CB1100 2020 , chúng tôi tiếp tục truyền đạt giá trị không thay đổi của nó. Ngoài ra, sự tương phản với kết cấu của vật liệu kim loại còn ấn tượng hơn nữa bởi màu sắc dựa trên màu đen duy nhất', N'cb1100.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (10, N'CB1100EX 2020                                                                                                                                         ', 1, 2, 435000000, 8, N'Làm mát bằng không khí trong dòng 4 xi-lanh 1100, tuy nhiên, đây là một động cơ muốn duy trì công nghệ giải nhiệt bằng gió.
Động cơ CB1100EX 2020 có vây cánh tản gió sâu và mỏng và được đánh bóng tinh xảo, khoảng cách vị trí cam tạo nhiều điển khuyết sâu để nhấn mạnh sự hiện diện của động cơ trông rất cổ điển. Động cơ CB1100EX 2020 có một nắp đầu xi lanh được thiết kế vòng nhôm và làm bằng thủ công đẹp. Tất cả kỹ thuật đều được bảo đảm chất lượng rất cao của Honda đây là một động cơ bốn xi-lanh thẳng hàng làm mát bằng không khí,chất lượng cân xứng với vẻ đẹp của chính động cơ, Và từ đó Honda CB1100EX 2020 có một cảm giác động cơ mạnh mẽ có thể cảm nhận được từ tốc độ thấp đến tốc độ cao.', N'cb1100ex.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (11, N'CB1100RS 2020                                                                                                                                         ', 1, 2, 512000000, 7, N'Chạy thưởng thức Honda CB1100RS 2020
Để theo đuổi niềm vui khi chạy mà muốn phát huy đầy đủ tiềm năng của Honda CB1100RS với động cơ 1100cc 4 xi-lanh làm mát bằng không khí. CB1100 RS trang bị bộ lốp 17 inch phía trước và phía sau rộng ở chân và kết hợp bánh xe bằng nhôm đúc, hơn nữa, một bộ giảm sốc phía trước quá cao cấp, một bộ giảm xóc phía sau đôi với một bình chứa dầu phụ và một cánh tay đòn bằng nhôm đuát ngang, giúp xe CB1100RS 2020 đạt được một cảm giác xoay nhanh nhẹn và xử lý nhanh nhạy. Ngoài ra, tay lái thấp đã được điều chỉnh để phù hợp với hiệu suất di chuyển, và vị trí yên ngồi được dời nhiều hơn về phía trước tạo cảm giác lái rất thoải mái.', N'cb1100rs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (12, N'CB1000R 2020
                                                                                                                                        ', 1, 2, 468000000, 10, N'Thiết kế kiểu dáng theo tỷ lệ hình thang dồn nén mạnh và hoạt động thên ổn định
Honda CB1000R 2020 có kiểu dáng thiết kế theo tỷ lệ hình thang cô đặc tạo ra kiểu dáng cơ bắp mạnh mẻ. Tất cả những chi tiết linh kiện là thể hiện sức mạnh của dòng "CB" thế hệ mới nhằm mục đích tăng giá trị phổ thông tổng quát của xe Moto thể thao.', N'cb1000r.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (13, N'CB1000R PLUS 350                                                                                                                                      ', 1, 2, 520000000, 9, N'Thiết kế kiểu dáng theo tỷ lệ hình thang dồn nén mạnh và hoạt động thên ổn định
Honda CB1000R 2019 có kiểu dáng thiết kế theo tỷ lệ hình thang cô đặc tạo ra kiểu dáng cơ bắp mạnh mẻ. Tất cả những chi tiết linh kiện là thể hiện sức mạnh của dòng "CB" thế hệ mới nhằm mục đích tăng giá trị phổ thông tổng quát của xe Moto thể thao.', N'cb1000r-plus-limited-edition.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (14, N'CB400SF 2020                                                                                                                                          ', 1, 2, 350000000, 11, N'Honda CB400SF 2020 Super Four 2019 thừa hưởng diện mạo hoành tráng của dòng CB1300SF đàn anh của nó, là tinh túy nhất cho những nghiên cứu khao học công nghệ đỉnh cao nhất của "DỰ ÁN LỚN-1". Nhìn chiếc Moto Honda CB400SF 2020 dễ nhận ra những đường sắc nét và mạnh mẽ chảy từ bình nhiên liệu sang nắp bên và sau đó đến đuôi đèn sau. Ngoài ra, đồng hồ tròn cổ điển hai mắt và đèn đuôi LED hai mắt là điểm nhấn đặc trưng của CB400SF 2020.

Càng xe lấy kiểu tách trái và phải, và thậm chí cả bánh mân xe xũng thay đổi thiết kế kiểu 10 chấu ở phía dưới, tất cả tại nên vẻ đẹp rất cổ điển nhưng chất lượng linh kiện hiện đại kết hợp thành 1 chất lượng cho chiếc xe Honda CB400SF super four 2020 huyền thoại.', N'cb400sf.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (15, N'Honda CB650R Neo Sport Cafe                                                                                                                           ', 1, 2, 244000000, 12, N'Honda CB650R 2022 Nhập Khẩu Thái Lan Chính Hãng Neo Sport Cafe, Honda CB650R 2022 của Honda gần như đứng một mình trong việc cung cấp sự kết hợp đó trong một cỗ máy cỡ 650. Thêm vào đó, chúng tôi gói gọn tất cả lại theo phong cách đương đại trên chiếc naked sportbike hiện đại mà chúng tôi gọi là Neo Sports Café. Đối với năm 2021, chúng tôi đã cập nhật động cơ, kiểu dáng và quan trọng nhất, bổ sung một phuộc Showa SFF-BP “Big Piston” 41mm mới, làm cho một cỗ máy tuyệt vời hơn nữa.', N'honda-cb650r-2022-neo-sport-cafe.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (16, N'Honda CB500F 2022                                                                                                                                     ', 1, 2, 177500000, 13, N'Honda CB500F 2022 mới, hàng nhập khẩu từ Thái Lan chính hãng, cao cấp, giá rẻ. Cưởi trên Honda CB500F 2022 giúp bạn khám phá tất cả những gì thành phố cung cấp, nhưng hãy làm theo phong cách riêng.Honda CB500F 2022 kết hợp sự nhanh nhẹn của một chiếc naked với dáng vẻ của một chiếc streetfighter thực thụ. Phuộc ngược Showa Separate Function Fork-Big Piston (SFF-BP) và đĩa đôi phía trước mới đảm bảo khả năng kiểm soát tối đa và lực phanh mạnh mẽ, trong khi động cơ xi-lanh đôi mạnh mẽ thú vị và dễ sử dụng, hoàn hảo cho người mới bắt đầu cũng như cho người đi xe máy có kinh nghiệm hơn. Ngoài ra, đồ họa mới, mạnh mẽ mang đến cho Honda CB500F 2022 một cái nhìn cao cấp và quyến rũ.

', N'honda-cb500f.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (17, N'Honda Hawk 11-1100cc                                                                                                                                  ', 1, 2, 560000000, 14, N'Honda Hawk 11-1100cc xe thể thao đường trường thế hệ mới nhất thay đổi quan niệm xe thể thao đường trường truyền thống.
', N'honda-hawk-11-1100cc.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (18, N'CBR1000RR SP                                                                                                                                          ', 1, 3, 580000000, 15, N'Hai phiên bản thể thao CBR1000RR Fireblades SP và SP2 mới với DNA thể thao của Honda bật nhất cùa Honda. Nhờ hệ thống treo bán chủ động Öhlins Control Control (S-EC) và giao diện Điều chỉnh dựa trên mục tiêu hlins (OBTi), bình titan 16L, calip khóa 4 pít-tông đơn Brembo và hộp số điện tử Quickshifter, mạch là nơi lý tưởng để khám phá định nghĩa của "tổng kiểm soát". Nếu các ngã rẽ trên đường đua là nỗi ám ảnh của bạn, thì Fireblade SP là dành cho bạn cảm giác an tâm nhất. Nếu bạn có máu đua, Fireblade SP2 là chiếc xe Moto siêu nhanh làm bạn hài lòng.', N'cbr1000rr-sp.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (19, N'CBR1000RR SP2                                                                                                                                         ', 1, 3, 690000000, 10, N'Thiết bị điện tử của CBR1000RR SP2 Fireblade giúp người lái cảm thấy thoải mái với chiếc xe Moto thể thao.

Bộ não điều khiển đa chức năng thông minh: IMU (Đơn vị đo lường quán tính) Nền tảng quán tính 5 trục (gia tốc 3 trục, tốc độ góc 2 trục), nằm gần trọng tâm của xe CBR1000RR SP2, là trung tâm thần kinh của Fireblade và liên tục diễn giải phân tích truyền lệnh góc lái và góc nghiêng ki xe vào cua IMU cũng thu thập dữ liệu về tốc độ bánh xe, tốc độ động cơ, sử dụng phanh và chân ga từ ECU và từ ABS. Dựa trên cài đặt hệ thống treo được chọn bởi tay nài, anh ta có thể tính toán giảm xóc thủy lực lý tưởng trong nén và mở rộng cần thiết ở các tốc độ khác nhau. Nâng bánh sau (Kiểm soát nâng sau, RLC) luôn duy trì thiết lập lý tưởng ngay cả trong khi phanh thô. Hệ thống ABS mới kiểm soát lực phanh theo góc nghiêng và giúp Fireblade cực kỳ an toàn ngay cả khi lái xe cực độ.', N'cbr1000rr-sp2.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (20, N'CBR600RR 2020                                                                                                                                         ', 1, 3, 420000000, 11, N'Honda CBR600RR 2020 của Honda nói về một điều: Hiệu suất và chúng ta không chỉ nói về tốc độ, chúng ta đang nói về sự cân bằng khó nắm bắt giữa sức mạnh, xử lý và phanh. Đi đầu trong di sản đua xe MotoGP của chúng tôi, chiếc xe Honda CBR600RR 2020 này là sự phản ánh chân thực về năng lực kỹ thuật của Honda.

Honda CBR600RR 2020 nhẹ, nhỏ gọn, nhanh nhẹn và cân bằng lý tưởng, với động cơ bốn xi-lanh trông giống như mọi thứ bạn chưa từng lái và một khung gầm đôi được thiết kế bằng nhôm mang lại khả năng xử lý sắc nét bằng laser. Vì vậy, cho dù bạn đi xe trên đường phố, khắc lên con đường hẻm núi yêu thích của bạn hoặc giải quyết những ngày theo dõi - hãy sẵn sàng khám phá xem một chiếc siêu xe 600cc có thể tốt như thế nào.', N'cbr600rr.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (21, N'CBR650R 2020                                                                                                                                          ', 1, 3, 262000000, 14, N'Đối với một số ngườiđả lái moto một thời gian nhất định, một khi bạn đã trải nghiệm động cơ 4 xilanh thẳng hàng với âm thanhphấn khích, sẽ không quay trở lại các dòng động cơ thông thường. Đó là lý do tại sao chúng tôi rất thích chiếc Honda CBR650R 2020 mới đó là một chiếc sportbike thực sự được chế tạo cho phong cách chúng ta đi Moto ngày hôm nay.

CBR650R 2020 với sức mạnh tốt là ngay lập tức và nó được sản xuất theo cơn sốt hút hàng thể thao 4 xi lanh dòng trung bình. Khung gầm, thân xe và vị trí ngồi đều được thiết kế để mang lại cảm giác thoải mái khi đi trên phố, nhưng vẫn giữ độ mát mẻ được khi trời óng. Nói tóm lại, chiếc xe CBR650R này chỉ đơn giản là sinh ra mang lại sự thú vị để đi nhẹ, nhanh nhẹn và phản ứng nhanh nhại nhất có thể.

', N'cbr650r.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (22, N'Honda GB350 2022                                                                                                                                      ', 1, 3, 230000000, 21, N'Một sự hiện diện thu hút trái tim bạn trong cái nhì đầu tiên
Honda GB350 hàng Nhật chính hãng trở thành một sự hiện diện đáng tin cậy nhằm nâng cao và hỗ trợ sự hiện diện của người lái. "GB" được thiết kế theo đuổi cảm giác thống nhất giữa con người và xe máy.', N'honda-gb350-2022.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (23, N'Honda GB350 S 2022                                                                                                                                    ', 1, 3, 245000000, 22, N'Một sự hiện diện thu hút trái tim bạn trong cái nhì đầu tiên
Honda GB350 S 2022 nhập khẩu từ Nhật chính ngạch trở thành một sự hiện diện đáng tin cậy nhằm nâng cao và hỗ trợ sự hiện diện của người lái. "GB" được thiết kế theo đuổi cảm giác thống nhất giữa con người và xe máy.', N'honda-gb350-s-2022.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (24, N'Honda CBR1000RR-R Fireblade                                                                                                                           ', 1, 3, 1045000000, 6, N'ĐƯỜNG ĐUA LÀ SÂN CHƠI CỦA BẠN Nơi bạn sống thực với đam mê CBR1000RR-R Fireblade SP được trang bị hệ thống giảm xóc Smart Electronic Control (S-EC) thế hệ 2 và cụm phanh Brembo Stylema trên phanh trước. Với khả năng vận hành vượt trội, CBR1000RR-R Fireblade SP là món quà đắt giá nhất của Honda dành tặng cho các tín đồ tốc độ. HÃY TẬN HƯỞNG !!!', N'honda-cbr1000rr-r-fireblade.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (25, N'Honda X-ADV 750                                                                                                                                       ', 1, 4, 680000000, 14, N'X-AVD 750 sx tại Italia Tinh thần tự do phiêu lưu
Đối với những người muốn tắt và trải nghiệm khám phá những trải nghiệm mới, cuộc phiêu lưu maxi-Scooter X-AVD 750 này sẽ cho phép bạn nắm bắt hoàn toàn bản chất tự do trong một hình thức mới và thú vị, xe X-AVD 750 cùng lúc lái phù hợo trên 03 loại đường như đường phố rất tuyện bởi hộp số DCT, đường trường với chức năng Street, phượt với chức năng off-road hiệu quả.', N'x-adv-750.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (26, N'Honda ADV 350 2021                                                                                                                                    ', 1, 4, 289000000, 30, N'Động cơ mới của Honda ADV 350 2021 là dòng động cơ của Forza 350, có dung tích xilanh 330cc eSP + giả nhiệt nước, phun xăng điện tử, đã tạo ra tiếng vang trong cho dòng Honda Forza 350 2020 được ra mắt trước đó một chút. Gần đây, Honda đang chuẩn bị tung ra một lần nữa với Honda ADV 350 2021 hoàn toàn mới trong dòng City Adventure', N'honda-adv-350-2021.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (27, N'Honda AVD 350                                                                                                                                         ', 1, 4, 395000000, 28, N'Honda ADV 350 mới sản xuất tại Thá lan, với thiết kế hầm hố, dữ dằn theo phong cách SUV bike, sẵn sàng thách thức cả trong thành phố và ngoại thành theo phong cách “bức phá không chờ một ai”. Honda AVD 350 mới kế thừa chiếc AVD 750 đàn anh đã thành công vang vội tại thị trường Châu Âu, ADV 350 2022 nó được tinh chỉnh nhỏ lại để phù hợp với tầm vóc người Châu Á. Động cơ cũng sử dụng dòng động cơ SH350I của Ý, tuy nhiên momen xoắn tinh chỉnh cao hơn để có bức phá phù hợp với dòng adventure.', N'honda-avd-350.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (28, N'Interstate 1300 2016                                                                                                                                  ', 1, 5, 485000000, 8, N'PHONG CÁCH CHOPPER SANG TRỌNG
Sau khi bạn lái Moto một vài năm, bạn bắt đầu thèm một chiếc xe Moto có nhiều tính năng và phong cách hơn thế nữa, và đó là lý do tại sao Honda Interstate 2016 có ý nghĩa rất lớn đối với nhiều người lái Moto lâu năm. Chiếc Interstate 1300 hoạt động tốt ở những khúc cua như trên đường lớn, nhờ động cơ V-Twin VTEC 1.321cc với bản đồ phun nhiên liệu cho cảm giác mô-men xoắn thấp tốt hơn. Chọn mẫu Moto Deluxe và bạn cũng có được kiểm soát lực kéo, Phanh chống khóa, v.v. Sức mạnh mượt mà, cảm hứng cầm lái và hiệu suất thuần túy là cách mà Interceptor thỏa mãn sở thích lái Moto tinh tế.', N'interstate-1300.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (29, N'Shadow Aero ABS 2020                                                                                                                                  ', 1, 5, 448000000, 16, N'PHONG CÁCH TRUYỀN THỐNG, HIỆU SUẤT CÔNG NGHỆ HIỆN ĐẠI.
Không có dòng Moto nào giống như dòng moto đường trường cổ điển Shadow Aero 750 2020 , bạn có được một vị trí ngồi lái thoải mái, chiều cao yên xe thấp và động cơ xi-lanh đôi lớn hoạt động mạnh mẽ. Đó là điều làm cho Honda Shadow Aero trở nên đặc biệt, cộng với nhiều thứ khác. Đối với người mới bắt đầu lái Moto, Shadow Aero với phong cách hiện đại được sắp xếp hợp lý đáp ứng theo American Classic thập niên 50, với bánh xe được kích hoạt, chắn bùn đầy đủ và bộ giảm âm dài, mạ crôm. Và hiệu suất Shadow Aero 750 2020 hoàn toàn hiện đại, lịch sự với động cơ V-Twin 745cc được điều chỉnh cho mô-men xoắn vòng quay thấp và ổ đĩa cuối cùng giảm thiểu bảo trì hao mòn. Thêm vào mức giá thấp, và chiếc xe Shadow Aero 2020 nàycó nhiều thú vị khi sở hữu và khi đi xe.', N'shadow-aero-abs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (30, N'Shadow Aero 2020                                                                                                                                      ', 1, 5, 350000000, 13, N'PHONG CÁCH TRUYỀN THỐNG, HIỆU SUẤT CÔNG NGHỆ HIỆN ĐẠI.
Không có dòng Moto nào giống như dòng moto đường trường cổ điển Shadow Aero 2020 , bạn có được một vị trí ngồi lái thoải mái, chiều cao yên xe thấp và động cơ xi-lanh đôi lớn hoạt động mạnh mẽ. Đó là điều làm cho Honda Shadow Aero 2020 trở nên đặc biệt, cộng với nhiều thứ khác. Đối với người mới bắt đầu lái Moto, Shadow Aero 2020 với phong cách hiện đại được sắp xếp hợp lý đáp ứng theo American Classic thập niên 50, với bánh xe được kích hoạt, chắn bùn đầy đủ và bộ giảm âm dài, mạ crôm. Và hiệu suất Shadow Aero 2020 hoàn toàn hiện đại, lịch sự với động cơ V-Twin 745cc được điều chỉnh cho mô-men xoắn vòng quay thấp và ổ đĩa cuối cùng giảm thiểu bảo trì hao mòn. Thêm vào mức giá thấp, và chiếc xe Shadow Aero 2020 nàycó nhiều thú vị khi sở hữu và khi đi xe.', N'shadow-aero.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (31, N'Shadow Phantom 750 2020                                                                                                                               ', 1, 5, 365000000, 10, N'SỨC MẠNH THAY LỜI MUỐN NÓI
Khi gặp người đối diện tự phụ, một người lặng lẽ tự tin, hoặc những người dưới quyền nhưng không bao giờ khuất phục bạn. Chúng ta đang nói về Honda Shadow Phantom 2020, một chiếc xe Moto khác biệt cho những gì nó không thể nói hết. Với các bánh xe nổi bật trên vành đen, phuộc trước cứng cáp, chắn bùn và các điểm nhấn màu đen mờ, Shadow Phantom 2020 tạo nên một lời tuyên bố mạnh mẽ. Vơi vị trí ngồi thẳng đứng thoải mái cho chuyến đi trong đô thị quá dễ dàng hoặc rong chơi cho chuyến nghỉ ngơi cuối tuần. Bộ ống xả động cơ V-Twin 745cc bị sơn đen và âm thanh của ống xả luôn luôn thông báo sự xuất hiện của bạn. Tất cả điều đó, với một cơ thể chắc chắn nên Shadow Phantom luôn thể hiện mạnh mẻ nhất trong màu đen.', N'shadow-phantom.jpg', 1, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (32, N'Fury 1300 2020                                                                                                                                        ', 1, 5, 485000000, 16, N'Kiều dáng chopper độc đáo
Nếu bạn là kiểu người hay đi theo phong cách chopper, thì hãy chọn mẫu xe độc đáo có một không hai này, bởi vì Honda Fury 2020 được chế tạo như chỉ dành cho bạn thưởng thức nó. Gây chấn động âm thanh xuống đường với động cơ V-Twin 1312cc, có rất nhiều loại động cơ xe moto. Nhưng Fury 1300 2020 tuyên bố động cơ với vẻ ngoài trau chuốt đẹp mắt không thể bỏ qua. Thân xe dài cơ bắp và có nghĩa là Fury 1300 được kéo dài gần 2,4m từ trục đến trục. Cho nên chiếc Fury 1300 là nghệ thuật hơn là chỉ đơn thuần chiếc Moto 2 bánh. Trong đó hầu hết các chế độ tập trung vào phong cách mang lại sự đồng bộ trong xử lý vận hành, Fury 1300 2020 hoàn toàn là Honda Chopper độc lạ mag lại sự thú vị cho bạn chạy nó.', N'fury-1300.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (33, N'Honda Rebel 300                                                                                                                                       ', 1, 5, 124000000, 30, N'HON DA REBEL 300 DÁNG BOBBER. Tuyệt vời đến tận cốt lõi.
Honda Rebel 300 2022 huyền thoại nổi dậy, theo phong cách của một chiếc mô tô bobber tùy chỉnh thực sự. Lần đầu tiên hợp nhất nâng cao và thiết kế cổ điển với đèn pha và đèn hậu LED tròn với các chức năng mới, đèn vị trí cần số và bộ ly hợp chống trượt.', N'honda-rebel-300.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (34, N'ST1300 2020                                                                                                                                           ', 1, 6, 580000000, 6, N'NHIỆM VỤ NHÂN ĐÔI
Khi bạn đang trên đường, bạn muốn một chiếc xe Moto có thể xử lý tất cả các vấn đề thì ST1300 của chúng tôi còn hơn cả nhiệm vụ cao cả. Muốn có thức ăn khi đói, với thùng lưu trữ tích hợp và thoải mái, bạn muốn ôm cua một số hẻm núi? ST1300 đã sẵn sàng để chạy ra các ngó đường, với hiệu suất có nguồn gốc CBR và với Hệ thống chống bó cứng phanh của chúng tôi, bạn có thể tự tin phanh dừng lại trong mọi điều kiện. Vì vậy, nếu hiệu suất chinh phục cho một đoạn đường dài là những gì bạn đang theo đuổi, thì ST1300 là nơi để bắt đầu để bạn trải nghiệm.

', N'st1300.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (35, N'Gold Wing F6B 2020                                                                                                                                    ', 1, 6, 760000000, 5, N'Honda Gold Wing 2020 sử dụng động cơ 6 xy-lanh dạng phẳng, dung tích 1.833 cc, sản sinh công suất 125 mã lực tại 5.500 vòng/phút và mô-men xoắn 170 Nm tại 4.500 vòng/phút. Phiên bản Gold Wing F6B 2020 tại Việt Nam được trang bị hộp số tự động ly hợp kép 7 cấp DCT. Đi kèm hộp số DCT là chế độ Walking Mode giúp giới hạn tốc độ xuống 1,8 km/h khi tiến và 1,2 km/h khi lùi.', N'gold-wing-f6b.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (36, N'Gold Wing Valkyrie 1800                                                                                                                               ', 1, 6, 680000000, 8, N'KIỀU DÁNG QUÁ HOÀN HẢO
Một số xe moto chỉ là tất cả sự hào nhoáng bên ngoài, Nhưng Honda Valkyrie 1800 là tất cả các chất. Chiếc Gold Wing F6C vạm vỡ, cơ bắp này là một chiếc Mô tô thuần túy nhưng toát lên sự độc lập với động cơ sáu xi-lanh 1.832cc nằm ngang của nó. Trên hết, Honda Valkyrie 1800 có kiểu dáng dòng cruiser hung hăng tạo nên sự táo bạo nhất trong các xe cùng phân khúc. Hãy chiêm ngưởng và trải nghiệm Honda Valkyrie một cảm giác tuyệt vời.

', N'gold-wing-valkyrie-1800.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (37, N'Honda NT1100 2022                                                                                                                                     ', 1, 6, 750000000, 10, N'Honda NT1100, ERA DÒNG MOTO DU LỊCH MỚI
Trải nghiệm một hành trình mới với Honda NT1100 Mới sẽ mang đến cho bạn nhiều hơn những gì bạn chưa từng trải nghiệm. Với động cơ kép thẳng hàng 1.100 CC mạnh mẽ với công nghệ Truyền động ly hợp kép (DCT) cho hiệu suất truyền động vượt trội. có thể đồng hành cùng bạn trên mọi nẻo đường và thiết kế du lịch thể thao cao cấp Được thiết kế để đáp ứng mọi điều kiện lái xe. Bất cứ khúc cua nào cũng có thể điều khiển xe theo ý muốn. Dù là quãng đường gần hay xa đều rất thoải mái khi lái xe Honda NT1100 Mới. Một kỷ nguyên mới của trải nghiệm lưu diễn.', N'honda-nt1100-2022.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (38, N'Honda CRF450RL 2022                                                                                                                                   ', 1, 7, 520000000, 10, N'HONDA CRF540RL 2022 SINH RA ĐỂ KHÁM PHÁ Đặt lộ trình cho con đường yêu thích của bạn và biến thế giới thành sân chơi của bạn, trên chiếc  Honda CRF450RL 2022 đáng kinh ngạc. Nó được thiết kế để giúp bạn vượt qua những địa hình khó khăn nhất và được trang bị mọi thứ bạn cần để có một chuyến về nhà dễ dàng.

', N'honda-crf450rl-2022.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (39, N'Honda XR650L 2022                                                                                                                                     ', 1, 7, 420000000, 10, N'Trong những lúc như thế này, tất cả chúng ta đều cần một thứ gì đó mà chúng ta có thể tin tưởng. Và trong thế giới xe moto thể thao hai nòng cỡ lớn, không gì có thể so sánh được với Honda XR650L 2021. Đó là một người sống sót khó khăn, đã được chứng minh, là nền tảng của đội hình hai môn thể thao của chúng tôi trong nhiều thập kỷ. Động cơ Honda XR650L 2021. xi-lanh đơn 644cc, làm mát bằng không khí, đơn giản của nó mang lại độ tin cậy huyền thoại và nhiều năng lượng, trong khi bộ khởi động điện giúp cuộc sống của bạn dễ dàng hơn. Hệ thống treo hành trình dài và khung thép chắc chắn được hoàn thiện ở Baja giúp làm phẳng những con đường đất và đường đi lại trong thị trấn, bất kể mặt đường tồi tệ đến mức nào. 

', N'honda-xr650l-2022.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (40, N'800MT - TOURING 2022, CF MOTO                                                                                                                         ', 1, 7, 210000000, 20, N'CFMOTO 800MT TOURING 2022 dòng xe moto chuyên đi phược và du lịch dả ngoại độc đáo thì những con đường phía trước không phải lúc nào cũng được xác định rõ ràng. Trên mỗi con đường, và xung quanh mọi khúc quanh chưa biết, những khám phá mới đang chờ đợi. Đôi khi bạn không biết phải đi đâu, nhưng bạn không thể quan tâm hơn với CFMOTO 800MT TUORING 2022 có thể chinh phục mọi thách thức.', N'800mt-touring-2022-cf.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (41, N'NINJA H2 2020                                                                                                                                         ', 2, 8, 950000000, 3, N'Kawasaki Ninja H2 2020 mang sức mạnh thuyết phục tay đua bởi công nghệ động cơ siêu tăng áp của Kawasaki trên các đường đua, Kawasaki Ninja H2 2020 tự hào với động cơ bốn xi-lanh 998cc mạnh mẽ, thiết bị điện tử hiện đại và hệ thống phanh Brembo mới nhất, Kawasaki Ninja H2 2020 và Ninja H2 Carbon đạt hiệu suất tốc độ không đối thủ trên mọi cung đường.', N'kawasaki-ninja-h2.png', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (43, N'Ninja H2 SX 2020                                                                                                                                      ', 2, 8, 860000000, 5, N'Kawasaki Ninja H2 SX 2020 là dòng xe thể thao đường trường sang trọng bậc nhất và hiệu suất đạt đến tầm cao mới của công nghệ moto 2 bánh, động cơ Kawasaki Ninja H2 SX 2020 sử dụng công nghệ siêu nạp tăng áp kết hợp cân bằng tiêu chí  thoải mái cho các tình huống đi đường hàng ngày cũng như dùng để đi đường dài được thoải mái hơn.', N'kawasaki-ninja-h2-sx.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (44, N'Ninja H2 SE 2020                                                                                                                                      ', 2, 8, 960000000, 4, N'Kawasaki Ninja H2 SX SE 2020 giúp mang lại sự sang trọng và hiệu quả đạt đến tầm cao mới của công nghệ mô tô 2 bánh của hãng Kawasaki, động cơ Kawasaki Ninja H2 SX 2020 sử dụng công nghệ tăng áp siêu nạp, chiếc xe cân đối được mục tiêu sử dụng  cho tình huống đi đường hàng ngày và cũng để đi đường dài thoải mái hơn.

Động cơ Kawasaki Ninja H2 SX SE 2020 sử dụng công nghệ đỉnh cao tăng áp siêu nạp cho ra công suất lên đến 300HP bản H2 R, 4 xi lanh thẳng hàng giải nhiệt nước, 6 cấp số, với hàng tá tính năng hỗ trợ cao cấp không thua 1 ô tô hạng sang, như kiểm soát lực kéo, lái điện tử, sang số nhanh, chóng bó ABS, cân bằng góc lái...', N'ninja-h2-se.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (45, N'Ninja H2 Carbon 2020                                                                                                                                  ', 2, 8, 1050000000, 2, N'Kawasaki Ninja H2 Carbon 2020 có sức mạnh siêu tốc áp dụng công nghệ động cơ siêu nạp tăng áp, cùng với công nghệ mới nhất của Kawasaki tạo ra dòng động cơ siêu mạnh cho Moto không có đối thủ hiện nay. Động cơ Kawasaki Ninja H2 Carbon 2020 sử dụng công nghệ đỉnh cao tăng áp siêu nạp cho ra công suất lên đến 300HP bản H2 R, 4 xi lanh thẳng hàng giải nhiệt nước, 6 cấp số, với hàng tá tính năng hỗ trợ cao cấp không thua 1 ô tô hạng sang, như kiểm soát lực kéo, lái điện tử, sang số nhanh, chóng bó ABS, cân bằng góc lái...', N'ninja-h2-carbon.jpg', 1, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (46, N'KLX 150 BF 2020                                                                                                                                       ', 2, 9, 79000000, 50, N'Kawasaki KLX150FB 2020 được nhiều giới trẻ Đông Nam Á tán thưởng, được dựa theo phiên bản Kawasaki KLX150 nâng cấp lên phiên bảng Kawasaki KLX150 BF 2020 với nhiều tính năng đáng quan tâm. Kawasaki KLX150 BF 2020 Họa tiết màu sắc rất lạ không nhầm lẩn vào đâu thoát khỏi màu truyền thống Kawasaki KLX150 BF là xanh và trắng Kawasaki KLX150 BF2020 có màu đen cam và xanh dương cam rất độc lạ.
Kawasaki KLX150 BF trang bị động cơ 149cc giải nhiệt gió, sử dụng chế hòa khí, giảm xóc up side down tối ưu hóa giảm xóc trước và sau mang lại sự vận hành càng êm ái trên các cung đường đá sỏi gồ ghề.', N'klx-150-bf.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (47, N'KLX 250 2020
                                                                                                                                        ', 2, 9, 139000000, 20, N'Kawasaki KLX 250 2020 mang đến hiệu suất lái xe tiêu chuẩn thoái mái trên đường phố và trên đường gồ ghề, đường phược, hỗ trợ cho người lái ở nhiều cấp độ và kỹ năng khác nhau. Chiếc xe Kawasaki KLX 250 2020 với hai mục đích sử dụng này tự hào có động cơ 249cc giải nhiệt nước 5 cấp số có khả năng mang lại một chuyến đi vượt trội, giúp bạn tự tin để đi xuyên qua các đường phố trong nội phố hoặc những con đường mòn ngoài đường nông thôn xa.', N'klx-250.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (48, N'D - Tracker 150 2020                                                                                                                                  ', 2, 9, 79000000, 15, N'D-Tracker 150 2020 tạo được sự khác biệt bởi bánh xe cao 17-inch, trang bị động cơ 1 xi-lanh 144cc làm mát bằng gió với sức mạnh tối thượng, khung xe chịu lực cao Perimeter, chiều cao yên thấp trong khi ánh sáng gầm cao cho nên D-Tracker 150 2020 có thể đi tốt trên mọi kiểu đường. D-Tracker 150 2020 là loại xe địa hình dạo phố kiểu dáng đẹp và bánh xe lớn, tuy nhiên vẩn tiềm ẩn cách phong trần dành riêng cho các phược thủ. Với công suất động cơ và hiệu quả khi vận hành đã được nghiêng cứu rất tì mĩ, đèn pha D-Tracker 150 2020 theo phong cách sang trọng với đèn LED, Halogen 35/35 W hoành đồng hồ đo tốc độ thiết kế mới cảm giác rất thời trang.', N'd-tracker-150.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (49, N'KLX250 Camo 2020                                                                                                                                      ', 2, 9, 142000000, 12, N'Kawasaki KLX 250 Camo 2020 mang đến hiệu suất lái xe tiêu chuẩn thoái mái trên đường phố và trên đường gồ ghề, đường phược, hỗ trợ cho người lái ở nhiều cấp độ và kỹ năng khác nhau. Chiếc xe Kawasaki KLX 250 Camo 2020 với hai mục đích sử dụng này tự hào có động cơ 249cc giải nhiệt nước 5 cấp số có khả năng mang lại một chuyến đi vượt trội, giúp bạn tự tin để đi xuyên qua các đường phố trong nội phố hoặc những con đường mòn ngoài đường nông thôn xa.

', N'kawasaki-klx250.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (50, N'Z900RS 2020                                                                                                                                           ', 2, 10, 395000000, 10, N'Kawasaki thống trị phong cách cổ điển của xe máy bằng bản hoài cổ Kawasaki Z900RS 2020 Retro Sport, Moto Kawasaki Z900RS ABS 2020 dựa theo các dạng xe cổ điển để thiết kế kiều dáng vượt thời gian pha lẩn thân xe vừa thể thao vừa theo phong cách retro thuần túy.

Dòng Z900RS ABS được hoàn thiện gắn động cơ 4 xi lanh dung tích 948cc, giải nhiệt nước, phun xăng điện tử kết hợp hàng loạt công nghệ hiện đại giúp cho Kawasaki Z900RS 2020 không những biểu dương kiểu dáng cổ điển nhưng lại mang trong mình tất cả các công nghệ tối ưu cho xe thể thao hoài cổ đúng nghĩa.', N'kawasaki-z900rs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (51, N'Z1000R 2020                                                                                                                                           ', 2, 10, 459000000, 11, N'Kawasaki Z1000R Edition 2020 là thành quả nghiên cứu thiết kế Sugomi tuyệt đẹp cho ra kiểu mô tô trông giống như một oái thú săn mồi trông rất hầm hố và dữ tợn, cho dù chạy ngoài trời sáng hay bóng tối thì Kawasaki Z1000R Edition 2020 không lẫn lộn với bất kỷ một xe mô tô thể thao dòng Naked nào khác. Kawasaki Z1000 phiên bản Z1000R Edition 2020 có tông màu mạnh mẽ kết hợp với màu xanh lá cây nổi bật cộng với cặp đèn pha mắt thú hoang dại, ngoài ra được gắn thêm cặp phanh đĩa Brembo M50 danh tiếng và giảm xóc sau Öhlins danh giá.', N'kawasaki-z1000r.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (52, N'Z900 ABS 2020                                                                                                                                         ', 2, 10, 288000000, 12, N'Chiếc mô tô Kawasaki Z900 ABS 2020 đã củng cố niền tin cho hãng Kawasaki về chiếc xe mô tô siêu lý tưởng dòng Nake chuyên dùng đi trong thành phố và đường trường. Kawasaki Z900 ABS 2020 với động cơ thiết kế mới nhỏ gọn nhưng mỗi vòng xoắn của bướm ga đều nang theo một khả năng tăng tốc sắc bén chưa từng có, tạo cảm giác phấn khích cho người lái ngay lần đầu tiên. Kawasaki Z900 ABS 2020 trang bị khối động cơ 4 xi lanh thẳng hàng dung tích 948cc, phun xăng kỹ thuật số, giải nhiệt nước, vòng tua máy tăng cực nhanh, Z900 ABS 2020 đặc biệt rất linh hoạt nhạy bén mang nhiều thú vị khi  bạn cầm lái.', N'kawasaki-z900-abs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (53, N'Z1000 ABS 2020                                                                                                                                        ', 2, 10, 412000000, 10, N'Kawasaki Z1000 ABS 2020 Kiểu dáng cực kỳ mạnh mẽ, dựa theo ngôn ngữ thiết kế của Sugimio tạo ra kiều dáng uy lực như con thú săn mồi ban đêm, sức mạnh của động cơ Kawasaki Z1000 ABS 2020 rất đang nể một khi bạn tăng tốc thì động cơ mở van tiết lưu nạp nhiên liêu khẩn cấp giúp cho chiếc Z1000 2019 ABS 2020 tăng vọt như một viên đan bán ra khỏi nòng súng. Kawasaki Z1000 2020 trang bị động cơ 4 xi-lanh thẳng hàng ngang, làm mát bằng dung dịch, dung tích xi lanh 1.043cc mang lại khả năng tăng tốc mạnh mẽ và hiệu suất tuyệt vời, ngoài ra còn tạo ra một loạt âm thanh pô rùng rợn khi bạn vặn ga.', N'z1000-abs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (54, N'Z650 ABS 2020                                                                                                                                         ', 2, 10, 185000000, 20, N'Kawasaki Z650 ABS 2020 Kiểu dáng Z mạnh mẽ, thiết kế kiểu dáng rất cá tính và sống động, Z650 ABS 2020 là sự pha trộn ý tưởng triết lý của nhà sản xuất Kawasaki, lấy kiểu dáng thể thao kết hợp sức mạnh của động cho ra đời chiếc Mo tô thể thao sử dụng linh hoạt hàng ngày. Kawasaki Z650 ABS 2020 nâng cấp bộ khung gầm mới rất chắc nhưng lại nhẹ, gắn khối động cơ 2 xi lanh song song có dung tích đến 649cc rất mạnh mẽ, giả nhiệt nước, 6 cấp số, phun xăng điện tử kỹ thuật số, bộ ly hợp chống trượt và bộ phanh ABS chống bó trước sau.', N'kawasaki-z650-abs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (55, N'Kawasaki Z400 2020                                                                                                                                    ', 2, 10, 149000000, 10, N'Kawasaki Z400 ABS hoàn toàn mới, đây là chiếc mô tô dòng Naked tầm nhỏ của hãng Kawasaki thiết kế dành riêng cho giới trẻ dùng đi lại hàng ngày trong thành phố. Kawasaki Z400 ABS 2020 là một dòng xe minh chứng xác thực cho thiết kế đột phá mới, vì khi ra đời Z400 ABS đã toát lên phong cách lái trên đường phố tươi mới, trẻ trung, khi cầm lái Z400 ABS  2020 mọi người sẽ nhận bạn trong giữa đám đông ngay lập tức. Kawasaki Z400 ABS sử dụng động cơ 2 xi lanh song song với dung tích 399cc, giải nhiệt nước, 6 cấp số, phun xăng kỹ thuật số tiên tiến. Bộ khung gầm nhỏ gọn nhưng lại có kiểu dáng thể thao dữ tợn, tư thế ngồi thấp rất thoải mái, chế độ lái rất cân bằng và có khả năng tăng tốc rất ấn tượng.', N'kawasaki-z400.png', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (56, N'Kawasaki ZH2 2020                                                                                                                                     ', 2, 10, 680000000, 2, N'Mẫu nakedbike Kawasaki ZH2 2020 mới nhất của gia đình Kawasaki Z-Series thừa hưởng đường nét thiết kế và sức mạnh khủng từ Ninja H2 2020. Kawasaki Z H2 2020 chính thức được vén màn tại triển lãm Tokyo Motor Show 2019. Ngay ở cái tên Kawasaki Z H2 2020, chúng ta có thể biết được đây là một mẫu xe thuộc dòng nakedbike Z-Series của Kawasaki và sở hữu một số DNA của mẫu siêu môtô Ninja H2 là siêu moto thể thao mạnh nhất hành tinh
', N'kawasaki-zh2.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (57, N'Ninja 400 SE 2020                                                                                                                                     ', 2, 11, 153000000, 10, N'Kawasaki Ninja 400 ABS SE 2020 trang bị động cơ 2 xi lanh song song, phun xăng điện tử, giải nhiệt bằng chất lỏng,  có dung tích 399cc, đây là dòng động cơ hoàn toán mới với nhiều cải tiến đang nể góp phần làm nên sự tinh tế với sức mạnh xi-lanh đôi của hãng Kawasaki.', N'ninja-400-se.png', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (58, N'Ninja 650 ABS 2020                                                                                                                                    ', 2, 11, 185000000, 10, N'Bí quyết giúp chiếc Kawasaki Ninja 650 ABS 2020 trờ thành chíếc moto thể thao đi trong thành phố tầm trung khá nổi tiếng là Kawasaki Ninja 650 ABS 2020 nhờ có được bộ khung gầm nhẹ, động cơ xi lanh đôi 649cc, phun xăng điện tử, 6 cấp số, giải nhiệt bằng chất lỏng có monen xoắn rất cao kết hợp hệ thống treo sau tiên tiến và hệ thống phanh ABS chóng bó mạnh mẽ.', N'ninja-650-abs.png', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (59, N'Ninja ZX6-R 636 2020                                                                                                                                  ', 2, 11, 440000000, 8, N'Kawasaki Ninja ZX-6R là bản xe thể thao tầm trung mới nhất, tự hào gắn động cơ 636cc mạnh mẽ đột phá, nhiều thiết bị điện tử tiên tiến hỗ trợ cho xe kết hợp một bộ khung gầm được thiết kế mới vững chắc và nhẹ hơn 3kgs so với đời trước.

Kawasaki ZX6-R 636 2020 đã được tối ưu hóa các chức năng hay nhất để có thể chạy trên đường phố và ngay trong các đường đua đều có hiệu quả cao nhất, mang đến trải nghiệm thú vị trong một loạt các tình huống xừ lý khi bạn chạy Ninja ZX6-R 2020 trên đường.', N'kawasaki-zx6-r.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (60, N'ZX10 KRT 2020                                                                                                                                         ', 2, 11, 588000000, 5, N'Kawasaki ZX10 KRT 2020 gắn động cơ 998cc, 4 xi lanh thẳng hàng, giải nhiệt nước, phun xăng điện tử tiên tiến nhất, với các công nghệ xử lý sức mạnh tuyệt vời và kiểu dáng ấn tượng đi kèm với các thiết bị điện tử cấp độ tinh vi đã giúp tay đua của Đội đua Kawasaki (KRT), Jonathan Rea, giành được bốn giải vô địch WorldSBK liên tiếp.', N'kawasaki-zx10-krt.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (62, N'Ninja Z1000 ABS 2020                                                                                                                                  ', 2, 11, 409000000, 6, N'Về tổng thể, Kawasaki Z1000 ABS 2020 vẫn giữ kiểu dáng có từ đời 2014 với ngôn ngữ thiết kế Sugomi đặc trưng. Phiên bản tiêu chuẩn sở hữu bộ tem có màu đen mờ ánh kim kết hợp với các họa tiết nổi bật màu đỏ. Trong khi đó, phiên bản Z1000 R được phối màu đen xanh kết hợp họa tiết hình chữ Z cách điệu ở ốp sườn 2 bên. Kawasaki Z1000 ABS và Z1000 R ABS 2020 vẫn sử dụng động cơ DOHC, 4 xy-lanh, dung tích 1.043 cc. Sản sinh công suất tối đa 142 mã lực tại 10.000 vòng/phút và mô-men xoắn 111 Nm tại 7.300 vòng/phút. Xe được trang bị hộp số côn tay 6 cấp.', N'kawasaki-ninja-z1000-abs.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (63, N'Vulcan S 650 2020                                                                                                                                     ', 2, 12, 239000000, 10, N'Kawasaki Vulcan S 650 2020 thiết kế pha trộn kiều dáng mô tô thể thao và phong cách mô tô cổ điển với động cơ Kawasaki Vulcan S 650 2020 là 649cc mạnh mẽ 2 xi lanh song song giả hiệt bằng nước cho ra mô men xoắn ân tượng, yên ngồi rộng thoải mái giúp người lái dũi thẳng chân khi cầm lái.
Chiếc Kawasaki Vulcan S 650 2020 này các kỹ sư dồn hết các kinh nghiệm vào thiết kế hộp số cho nên cho dù bạn chạy đi làm hay chạy trong phố hoặc đi đường xa đều có thể tận hưởng một chuyến đi trong ngày rất tuyệt, Kawasaki Vulcan S 650 2020 thêm hiệu suất lái và  truyền cảm hứng cho bạn trong mỗi chuyến đi.', N'kawasaki-vulcan-s-650.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (64, N'Vulcan S ABS SE 2020                                                                                                                                  ', 2, 12, 241000000, 10, N'Kawasaki Vulcan S 650 SE 2020 thiết kế pha trộn kiều dáng mô tô thể thao và phong cách mô tô cổ điển với động cơ Kawasaki Vulcan S 650 là 649cc mạnh mẽ 2 xi lanh song song giả hiệt bằng nước cho ra mô men xoắn ân tượng, yên ngồi rộng thoải mái giúp người lái dũi thẳng chân khi cầm lái.

Chiếc Kawasaki Vulcan S 650 SE này các kỹ sư dồn hết các kinh nghiệm vào thiết kế hộp số cho nên cho dù bạn chạy đi làm hay chạy trong phố hoặc đi đường xa đều có thể tận hưởng một chuyến đi trong ngày rất tuyệt, Kawasaki Vulcan S 650 2020 SE thêm hiệu suất lái và  truyền cảm hứng cho bạn trong mỗi chuyến đi.', N'kawasaki-vulcan-s-abs-se.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (65, N'Vulcan 900 Custom 2020                                                                                                                                ', 2, 12, 420000000, 10, N'Kawasaki Vulcan 900 Custom 2020 với động cơ Twin giải nhiệt nước, phun xăng điện tử tiên tiến, với sức mạnh của động cơ và thiết kế thân xe cơ bắp cho bạn tận hưởng sự hợp nhất năng động của thiết kế chế tạo bằng tay và hàng loạt các tính năng hoàn thiện cao cấp của Kawasaki Vulcan 900 Custom 2020, một sự kết hợp kỹ thuật công nghệ và phong cách đầy mê hoặc chỉ có thể đến từ Kawasaki Vul can 900 Custom 2020 .', N'vulcan-900-custom.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (66, N'VERSYS X 300 ABS 2020                                                                                                                                 ', 2, 13, 169000000, 20, N'Kawasaki Versys X 300 ABS 2020 dựa trên động cơ xi-lanh đôi 296cc nhỏ gọn và nhạy bén linh hoạt, KKawasaki Versys X 300 ABS 2020 là một chiếc mô tô nhẹ xử lý nhanh nhẹn, sẵn sàng thực hiện bất kỳ cuộc phiêu lưu bất cứ nơi nào.', N'kawasaki-versys-x-300-abs397x.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (67, N'W175 cafe                                                                                                                                             ', 2, 14, 68000000, 50, N'Kawasaki W175 cafe 2020 kiều dáng thiết kế và các chức năng xe hoàn toàn mới, W175 cafe là mẫu mới nhất trong gia đình của W, đây là một mẫu mô tô retro tầm nhỏ đích thực dành cho thị trường châu Á.
Kawasaki W175 cafe 2020 là một sự thay đổi đẳng cấp ý tưởng đi mô tô nhỏ cho những người đi làm và người  yêu thích thể  thao đích thực, Kawasaki W175 2020 chào đón những người lái xe đến thế giới của W cùa Kawasaki.', N'w175-cafe.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (68, N'W250 2020                                                                                                                                             ', 2, 14, 220000000, 12, N'Kawasaki W250 2020, một mẫu khác trong gia đình của W W, là một mẫu retro đích thực dành cho thị trường châu Á. Bổ sung cho W800, chiếc middleclass thời trang W mang đến cho khách hàng sành điệu một cỗ máy pha trộn vẻ cổ điển với khả năng lái xe hiện đại và độ tin cậy - một niềm vui khi lái xe, và phong cách hơn, thay thế cho những chiếc xe đạp thể thao của các tay đua có thể nhìn thấy ở mọi góc Kawasaki W250 2020.', N'kawasaki-w250.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (69, N'W800 Street 2020                                                                                                                                      ', 2, 14, 440000000, 5, N'Kawaski W800 2020 là kết quả của sự thiết kế trao chuốt kỹ lưỡng cho ra vẻ đẹp hoài cổ độc đáo, cảm giác lái rất tuyệt với bạn không ngời rằng khả năng linh hoạt nhại bén và tăng tốc tốt có thể có trên một chiếc mô tô cổ điển như kawasaki W800 2020 .', N'kawasaki-w800.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (70, N'W800 Cafe 2020                                                                                                                                        ', 2, 14, 460000000, 2, N'Kawaski W800 2020 Cafe dựa trên tinh thần thiết kế dòng xe thể thao Kawasaki vào những năm 1960, ăn sâu các đường nét thiết kế trong chiếc mô tô cổ điển retro 2018 của Kawasaki W800 2020 Cafe.', N'kawasaki-w800-cafe.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (71, N'Jawa Classic 300 2021                                                                                                                                 ', 3, 17, 170000000, 30, N'Jawa Classic 300 2021 được ví như một tác phẩm mô mô kinh điển hoàn hảo là vượt thời gian. Co dù chỉ trưng bày ở ngay tại nhà, hoặc chạy bất kể đi đâu. Khi gặp gỡ Jawa Classic 300 2021 các bạn khôi khỏi ngắm nhìn và trầm trồ khen ngợi. Với những đường cong cổ điển và mạ crôm bóng bẩy, Jawa Classic kết hợp giữa đẳng cấp hoài cổ và kỹ thuật hiện đại để có một cái nhìn vượt thời gian và một chuyến đi không giống ai.', N'jawa-classic-350-2021.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (72, N'Jawa 350 Perak 2021                                                                                                                                   ', 3, 17, 175000000, 20, N'Chiếc xe Moto Jawa 350 Perak 2021 sự hồi tưởng về chiếc xe trong thế chiến thứ 2 bị tàn phá ở Tiệp Khắc, quê hương của chiếc xe máy Jawa, nằm dưới sự chiếm đóng của Đức Quốc xã. Jawa đã bị ngưng sản xuất, vì các nhà máy của họ đã bị SS tiếp quản và sử dụng để giữ cho các phương tiện quân sự của Đức Quốc xã hoạt động sản xuất vũ khí. Trong bóng tối của thời kỳ đen tối này, một nhóm các kỹ sư của Jawa, do Tiến sĩ J Frei dẫn đầu, đã làm việc bí mật trong một dự án mới. Đội ngũ này, bao gồm Josef Jozil và Rudolphe Vykoukal, biết rằng những nguy cơ chiến tranh không thể tồn tại mãi mãi và thế giới một ngày nào đó sẽ sẵn cần một chiếc xe máy Jawa 350 Perak 2021 mới.', N'jawa-350-perak-2021.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (73, N'Jawa Forty Two 42 2021                                                                                                                                ', 3, 17, 165000000, 20, N'Đó là một moto Jawa Forty Two 42 2021 rất ổn định  có thể nói nó tuyệt với giống như không có Jawa nào bạn từng thấy trước đó. Đó là cùng một độ tin cậy chắc chắn, nhưng với một cái nhìn mới mẻ, hiện đại  đối với xe Jawa Forty Two 42 2021 Từ lớp hoàn thiện mờ chất lượng đến các chi tiết mạ crôm chói lọi, Jawa Forty Two (420 đại diện cho một chương mới rực rỡ trong lịch sử Jawa.', N'jawa-350-forty-two.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (74, N'Honmaki Bobber 400                                                                                                                                    ', 4, 18, 140000000, 39, N'Honmaki Bobber 400 2021 thiết kế mới mang theo phong cách Mỹ, kiểu dáng đầy cơ bắp, thân xe to trọng tâm xe thấp với động cơ V twin 400cc làm cho moto Honmaki Bobber 400 có kiểu dáng rất ngầu nhưng không kém phần sang trọng. Honmaki Bobber 400 2021 lần đầu tiền ra mắt tại hội chợ triển lãm tại Milan năm 2016, sau đó phát triển thành những mẫu xe Bobber 250, Bobber 300 và mới đây nhất đã có ra mắt dòng Honmaki Bobber 400cc. Đặc biệt trang bị cho xe là khối động cơ V Twin 400cc giải nhiệt nước, phun xăng điện tử rất xịn không thua kém các thế hệ Moto bobber đàn anh từng làm mưa làm gió tại thị trường Châu Âu và Mỹ.', N'honmaki-bobber-400.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (76, N'Honmaki Bobber 650 2021                                                                                                                               ', 4, 18, 165000000, 20, N'Honmaki Bobber 650 2021, xe sang giá rẻ
Honmaki Bobber 650 2021, Chiếc moto có kiểu dáng rất thu hút bởi thiết kế mới đậm chất chơi xe trang bị nhiều linh kiện đẹp, chất lượng cao, công nghệ tiến tiến tiêu chuẩn khí thải Euro 5, giá rẻ, hứa hẹn là một mẫu xe khá hấp dẫn lắp đầy phân khúc xe bobber vố dĩ quá đắc đỏ do Triumph và Harley độc chiếm kiều dáng này qua mấy thập niên.', N'honmaki-bobber-650-2021.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (77, N'Cafe Racer XN400                                                                                                                                      ', 4, 18, 86000000, 30, N'Cafe Racer XN400', N'cafe-racer-xn400.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (78, N'BMW S 1000 RR                                                                                                                                         ', 5, 19, 950000000, 3, N'Ông vua của dòng siêu xe thể thao.
Luôn ép đến giới hạn và tìm kiếm đường chạy hoàn hảo, cỗ máy 207 mã lực giờ đã trong tay bạn. Một sức mạnh không bị kìm hãm đẩy chiếc RR của bạn đến mức tối đa – với mô-men xoắn cực đại 113 Nm tại 11.000 vòng/phút và biểu đồ mô-men xoắn đạt ít nhất 100 Nm trong phạm vi từ 5.500 đến 14.500 [vòng/phút]. Mười năm sau thế hệ đầu tiên của RR đã làm mê hoặc thế giới xe máy, giờ chúng ta đang bước vào một cấp độ mới của sự hiệu năng cao. Chúng tôi đã tinh chỉnh gần như mọi thành phần của chiếc RR – từ trước đến sau. Kết quả: trọng lượng nhẹ hơn và hiệu suất cao hơn rõ rệt. Bạn đã sẵn sàng cho vị trí đầu bảng và sự chiến thắng? Chiếc xe RR đang chờ bạn.', N's1000rr.png', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (79, N'Triumph T120                                                                                                                                          ', 6, 20, 505000000, 3, N'Triumph Bonneville T120 là dòng xe làm nên thành công và là thương hiệu của Triumph từ những năm thập niên 60 Và một lần nữa hãng xe danh tiếng Anh Quốc Triumph đã mang Bonneville trở lại với vẻ ngoài hấp dẫn hơn bao giờ hết đi kèm đó là sức mạnh vượt trội đến từ động cơ lên đến 1200cc với những công nghệ hàng đầu đi kèm', N'triumph-t120.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (80, N'GSXR1000 ABS 2020                                                                                                                                     ', 7, 21, 680000000, 3, N'Khung xe GSXR1000 2020 đôi bằng nhôm nhẹ, nhỏ gọn,"thiết kế nhẹ" bao gồm bốn phần. Khung chính được đúc ở bên trong và ép bên ngoài để tối ưu hóa cân bằng độ cứng cho xe, nó được kết nối với đầu lái và móc treo động cơ phía trước đã trở thành một khối nhôm đúc không thể thiếu, phía trên, giá treo động cơ thấp hơn và trục xoay tay để tiện cho lắp ráp động cơ. 
GSXR1000 2020 có tay vịn bu-lông (khung phía sau) được làm bằng ống nhôm với tiết diện vuông và tay xoay bằng nhôm giúp tối ưu hóa sự cân bằng của trọng lượng và độ cứng. 
Bình xăng GSXR1000 2020 được thiết kế thấp, giúp mũ dễ dàng hạ xuống, ngoài ra  phía sau bình xăng mỏng và mượt mà, giúp người lái dễ dàng chuyển trọng lượng qua lại. Cả hai mặt trước đều có hình dạng để bình xăng có thể được giữ dễ dàng khi vào cua, và nó được kết nối với dòng chảy từ bình xăng đến yên ngồi', N'gsxr1000-abs.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (81, N'MT09 2020                                                                                                                                             ', 8, 22, 320000000, 10, N'Mẫu xe MT 09 2019
MT09 2020 xe thể thao trần trụi đẳng cấp đóng gói phong cách mạnh mẽ và hiệu suất ấn tượng, Hypernaken nguyên bản của Yamaha đã mở ra phân khúc sportbike. Hiện đang đeo huy hiệu MT-09 và tinh tế hơn bao giờ hết, nó có động cơ ba động cơ mạnh mẽ, kiểm soát lực kéo có thể điều chỉnh, phuộc có thể điều chỉnh hoàn toàn, ABS và vẻ ngoài hung dữ không giống bất cứ thứ gì khác trên đường.', N'mt09.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (82, N'MT10 2020                                                                                                                                             ', 8, 22, 520000000, 5, N'Điều khiển kỹ thuật số tiên tiến
MT-10 có một loạt các hệ thống được cung cấp bởi YCC-T®, một hệ thống bướm ga đi bằng dây cung cấp khả năng điều khiển động cơ đặc biệt chính xác. Chế độ D cho phép người lái chọn một phản ứng động cơ ưa thích chỉ trong tích tắc. Hệ thống kiểm soát lực kéo (TCS) hỗ trợ người lái quản lý lực kéo của lốp sau trên nhiều điều kiện đường khác nhau, MT-10 cũng bao gồm kiểm soát hành trình để cải thiện sự thoải mái khi đi trên đường cao tốc.', N'mt10.jpg', 0, 0)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (83, N'YZF-R6 2020
                                                                                                                                         ', 8, 22, 520000000, 5, N'Vẻ đẹp, công nghệ, tốc độ: YZF-R6 có tất cả!
Trên đường đua hoặc đường phố,Yamaha YZF-R6 là một trong những máy siêu tốc tiên tiến nhất từng được chế tạo. Kiểu dáng khí động học MotoGP kết thúc một cỗ máy đua cực kỳ thông minh, hoàn chỉnh với hệ thống phanh ABS, hệ thống treo trên kệ điện tử', N'yzf-r6.jpg', 0, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [price], [quantity], [description], [main_image], [hot_product], [featured_product]) VALUES (84, N'Superbike 1299 Panigale S                                                                                                                             ', 9, 23, 1235000000, 3, N'Ducati 1299 Panigale S vẫn kế thừa đặc trưng cơ bản của 1199 Panigale bên cạnh đó đã được cải tiến, sửa đổi với những nhược điểm ở thiết kế, động cơ và tính năng công nghệ để đem đến một chiếc sportbike tốt nhất cho người dùng. Trên Ducati 1299 Panigale S: cụm đèn pha sử dụng công nghệ LED hoàn toàn cho khả năng chiếu sáng cực tốt.
 Một trong những điểm mới trên Ducati 1299 Panigale S là nút chuyển chế độ chạy đặt ở phía bên trái, người dùng sẽ không càn phải cào menu chọn chế dộ giống như trên 1199 Panigale mà có thể chuyển chế độ ngay lập tức thông qua nút bấm này. Bên cạnh đó là nút chuyển số nhanh màu xám đặt tách biệt hẳn so bới nút còn lại.
 Là mẫu xe cao cấp nhất nên Ducati 1299 Panigale S được trang bị rất nhiều công nghệ hiện đại. Có thể kể đến như bộ đo lường quán tính IMU, 3 chế độ chạy: Race, Sport, Wet, hệ thống điều chỉnh công suất động cơ, hệ thống chống bó cứng phanh ABS khi vào cua, hệ thống kiểm soát lực kéo DTC, hệ thống iểm soát lực mốc đầu DWC, hệ thống hỗ trợ sang số nhanh DQS lên xuống, hệ thống ga điện tử RBW, hệ thống thu nhận dữ liệu DDA với GPS, hệ thống tự động xác định thông số lốp ATC.', N'ducati-1299-panigale-s.jpg', 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Admin                                             ')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'User                                              ')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (2, N'admin                                                                                                                                                 ', N'admin', N'admin@gmail.com                                                                                                                                       ', N'0967090500', N'e10adc3949ba59abbe56e057f20f883e                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (6, N'user                                                                                                                                                  ', N'user', N'user@gmail.com                                                                                                                                        ', N'0923115127', NULL, 2)
INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (7, N'user1                                                                                                                                                 ', N'user1', N'user1@gmail.com                                                                                                                                       ', N'0125125612', N'e10adc3949ba59abbe56e057f20f883e                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 2)
INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (8, N'user2                                                                                                                                                 ', N'user2', N'user2@gmail.com                                                                                                                                       ', N'0125164361', N'e10adc3949ba59abbe56e057f20f883e                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 2)
INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (9, N'user3                                                                                                                                                 ', N'user3', N'user3@gmail.com                                                                                                                                       ', N'0912512561', N'e10adc3949ba59abbe56e057f20f883e                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 2)
INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (10, N'user4                                                                                                                                                 ', N'user4', N'user4@gmail.com                                                                                                                                       ', N'0987654321', N'e10adc3949ba59abbe56e057f20f883e                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 2)
INSERT [dbo].[Users] ([user_id], [user_name], [fullname], [email], [number_phone], [password], [role_id]) VALUES (11, N'user5                                                                                                                                                 ', N'user5', N'user5@gmail.com                                                                                                                                       ', N'0912512565', N'e10adc3949ba59abbe56e057f20f883e                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([brand_id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Brands]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([status_id])
REFERENCES [dbo].[OrderStatus] ([status_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Product_Images]  WITH CHECK ADD  CONSTRAINT [FK_Product_Images_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Product_Images] CHECK CONSTRAINT [FK_Product_Images_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([brand_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Loki_PKL] SET  READ_WRITE 
GO
