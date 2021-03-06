USE [master]
GO
/****** Object:  Database [BDApiRest]    Script Date: 11/06/2022 07:14:37 ******/
CREATE DATABASE [BDApiRest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDApiRest', FILENAME = N'/var/opt/mssql/data/BDApiRest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDApiRest_log', FILENAME = N'/var/opt/mssql/data/BDApiRest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDApiRest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDApiRest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDApiRest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDApiRest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDApiRest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDApiRest] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDApiRest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDApiRest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDApiRest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDApiRest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDApiRest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDApiRest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDApiRest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDApiRest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDApiRest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDApiRest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDApiRest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDApiRest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDApiRest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDApiRest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDApiRest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDApiRest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDApiRest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDApiRest] SET RECOVERY FULL 
GO
ALTER DATABASE [BDApiRest] SET  MULTI_USER 
GO
ALTER DATABASE [BDApiRest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDApiRest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDApiRest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDApiRest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDApiRest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDApiRest] SET QUERY_STORE = OFF
GO
USE [BDApiRest]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 11/06/2022 07:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoComprobante] [char](2) NULL,
	[IdProveedor] [int] NULL,
	[Proveedordescripcion] [varchar](60) NULL,
	[Serie] [varchar](4) NULL,
	[Numero] [bigint] NULL,
	[MedioPago] [char](2) NULL,
	[CondicionPago] [char](2) NULL,
	[FecEmision] [datetime] NULL,
	[FecVencimiento] [datetime] NULL,
	[SubTotal] [decimal](18, 4) NULL,
	[Igv] [decimal](18, 4) NULL,
	[Total] [decimal](18, 4) NULL,
	[FecCreacion] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompraDetalle]    Script Date: 11/06/2022 07:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [bigint] NULL,
	[IdProducto] [bigint] NULL,
	[IdUnidadMedida] [int] NULL,
	[Cantidad] [decimal](18, 4) NULL,
	[PrecioUnitario] [decimal](18, 4) NULL,
	[Total] [decimal](18, 4) NULL,
 CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 11/06/2022 07:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[FecCreacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/06/2022 07:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](12) NULL,
	[Descripcion] [varchar](100) NULL,
	[NombreComercial] [varchar](50) NULL,
	[IdMarca] [int] NULL,
	[PrecioVenta] [decimal](18, 4) NULL,
	[PrecioCompra] [decimal](18, 4) NULL,
	[Stock] [decimal](18, 4) NULL,
	[IdUnidadMedida] [int] NULL,
	[FecCreacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11/06/2022 07:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [varchar](20) NULL,
	[RazonSocial] [varchar](150) NOT NULL,
	[Apellido] [varchar](150) NULL,
	[Nombre] [varchar](150) NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[FecIngreso] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK__PROVEEDO__E8B631AF47DCF8AE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 11/06/2022 07:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](5) NULL,
	[Descripcion] [varchar](30) NULL,
	[FecCreacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_UnidadMedida] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/06/2022 07:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[CodTrabajador] [varchar](10) NULL,
	[Nombres] [varchar](150) NULL,
	[Apellidos] [varchar](150) NULL,
	[Clave] [varchar](50) NULL,
	[FecIngreso] [datetime] NULL,
	[Aleas] [varchar](250) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([Id], [Nombre], [FecCreacion], [Activo]) VALUES (1, N'LIFAN', CAST(N'2022-06-10T09:11:50.933' AS DateTime), 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [FecCreacion], [Activo]) VALUES (2, N'KTM', CAST(N'2022-06-10T09:11:50.933' AS DateTime), 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [FecCreacion], [Activo]) VALUES (3, N'HAOJIN', CAST(N'2022-06-10T09:11:50.933' AS DateTime), 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [FecCreacion], [Activo]) VALUES (4, N'PIAGGIO', CAST(N'2022-06-10T09:11:50.933' AS DateTime), 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [FecCreacion], [Activo]) VALUES (5, N'HERO', CAST(N'2022-06-10T09:11:50.933' AS DateTime), 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [FecCreacion], [Activo]) VALUES (6, N'DAYUN', CAST(N'2022-06-10T09:11:50.933' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (1, N'SP-07599-3', N'KIT EMPAQUES P/BOMBA TIPO VE C/RETEN 31MM', N'KIT EMPAQUES P/BOMBA TIPO VE C/RETEN 31MM', 1, CAST(80.0000 AS Decimal(18, 4)), CAST(120.0000 AS Decimal(18, 4)), CAST(4692.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (2, N'SP-07615', N'KIT DE EMPAQUES C/ORING DE TAPA GRUESO', N'KIT DE EMPAQUES C/ORING DE TAPA GRUESO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(5336.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (3, N'SP-07620', N'KIT DE CAJA PARA ELEMENTOS BRIDA', N'KIT DE CAJA PARA ELEMENTOS BRIDA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(12.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (4, N'SP-07635', N'KIT DE CAJA PARA BOMBA C/ELEMENTO TIPO P', N'KIT DE CAJA PARA BOMBA C/ELEMENTO TIPO P', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(12387.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (5, N'SP-07693', N'RETEN DE BOCINA P/GOBERN RLD 20.2X9.5X4.7', N'RETEN DE BOCINA P/GOBERN RLD 20.2X9.5X4.7', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(4956.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (6, N'SP-07719', N'KIT DE GOBERNADOR DE BOMBAS RLD 6CYL', N'KIT DE GOBERNADOR DE BOMBAS RLD 6CYL', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(353.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (7, N'SP-07723', N'KIT DE GOBERNADOR DE BOMBAS RLD 4CYL', N'KIT DE GOBERNADOR DE BOMBAS RLD 4CYL', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(5.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (8, N'SP-07742', N'RETEN PLANO', N'RETEN PLANO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(5412.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (9, N'SP-07759', N'KIT DE EMPAQUES PARA BOMBA TIPO MW', N'KIT DE EMPAQUES PARA BOMBA TIPO MW', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(4863.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (10, N'SP-07760', N'VALVULA DE RETORNO OUT = SP-12128', N'VALVULA DE RETORNO OUT = SP-12128', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(4991.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (11, N'SP-07771', N'LAINA DE CABEZAL CON RANURA', N'LAINA DE CABEZAL CON RANURA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(30.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (12, N'SP-07793', N'DAMPER DE VOLVO', N'DAMPER DE VOLVO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(54.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (13, N'SP-08124', N'KIT DE BOCINA DE TAPA DE VE', N'KIT DE BOCINA DE TAPA DE VE', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(50.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (14, N'SP-08130', N'EXENTRICA CON DOBLE PESTAÑA', N'EXENTRICA CON DOBLE PESTAÑA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(50.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (15, N'SP-08157', N'EJE DE ACELERACION', N'EJE DE ACELERACION', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(55.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (16, N'SP-08198', N'ELEMENTO DE FORDSON SIMS DE 7R', N'ELEMENTO DE FORDSON SIMS DE 7R', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (17, N'SP-08218', N'VALVULA DOSIFICADORA 620C', N'VALVULA DOSIFICADORA 620C', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(5000.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (18, N'SP-08290', N'KIT DE EMPAQUES PARA DPS200', N'KIT DE EMPAQUES PARA DPS200', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (19, N'SP-08358', N'TAPON DE CABEZAL PRECAMARA PEQUEÑA', N'TAPON DE CABEZAL PRECAMARA PEQUEÑA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(213.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (20, N'SP-08542', N'EMBOLO SUPER', N'EMBOLO SUPER', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (21, N'SP-08568', N'KIT DE EMPAQUES PARA BOMBAS DPC', N'KIT DE EMPAQUES PARA BOMBAS DPC', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(4982.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (22, N'SP-08595', N'SOLENOIDE DE 24V.', N'SOLENOIDE DE 24V.', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (23, N'SP-08662', N'CONJUNTO DE BOMBA ALIMENTACION', N'CONJUNTO DE BOMBA ALIMENTACION', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(30.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (24, N'SP-08685', N'KIT DE EMPAQUES PARA BOMBA TIPO VE', N'KIT DE EMPAQUES PARA BOMBA TIPO VE', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(48.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (25, N'SP-08720', N'KIT DE EMPAQUES BOMBA C/ELEM BRIDA ORING REDONDO', N'KIT DE EMPAQUES BOMBA C/ELEM BRIDA ORING REDONDO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(56.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (26, N'SP-08727', N'KIT DE GOBERNADOR DE BOMBAS R801 4CYL', N'KIT DE GOBERNADOR DE BOMBAS R801 4CYL', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(33.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (27, N'SP-08739', N'PALETAS DE CARBON', N'PALETAS DE CARBON', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(56.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (28, N'SP-08740', N'DESLIZADOR CORTO', N'DESLIZADOR CORTO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(56.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (29, N'SP-08752', N'KIT DE BOMBA ALIMENTACION', N'KIT DE BOMBA ALIMENTACION', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(52.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (30, N'SP-08768', N'SOLENOIDE DE 24V NISSAN', N'SOLENOIDE DE 24V NISSAN', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(4977.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (31, N'SP-08769', N'SOLENOIDE DE 12V NISSAN', N'SOLENOIDE DE 12V NISSAN', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(53.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (32, N'SP-08770', N'SOLENOIDE DE 12V TOYOTA', N'SOLENOIDE DE 12V TOYOTA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (33, N'SP-08897', N'RETEN DE BOCINA 18.1X9.5X5.0', N'RETEN DE BOCINA 18.1X9.5X5.0', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(46.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (34, N'SP-08964', N'KIT DE EMPAQUES PARA CAT MOD MANGUITO', N'KIT DE EMPAQUES PARA CAT MOD MANGUITO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(59.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (35, N'SP-08989', N'RESORTE,DISCO INTERMEDIO,TROMPI (3EN1)', N'RESORTE,DISCO INTERMEDIO,TROMPI (3EN1)', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (36, N'SP-09026', N'TOPES GRANDES DE GOBERNADOR RQVK C/TOPES GRANDES', N'TOPES GRANDES DE GOBERNADOR RQVK C/TOPES GRANDES', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (37, N'SP-09114', N'CASQUILLO DE INYECTOR DE VOLVO', N'CASQUILLO DE INYECTOR DE VOLVO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(52.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (38, N'SP-09137', N'VALVULA DE RETENCION RACOR DE 14 C/VILLA', N'VALVULA DE RETENCION RACOR DE 14 C/VILLA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (39, N'SP-09380', N'RETEN CHUPON', N'RETEN CHUPON', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (40, N'SP-09437', N'SOLENOIDE DE 12V DE 2 SALIDAS', N'SOLENOIDE DE 12V DE 2 SALIDAS', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (41, N'SP-09531', N'SOLENOIDE DE 24V TOYOTA', N'SOLENOIDE DE 24V TOYOTA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(4988.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (42, N'SP-09578', N'TOBERA DLL145S73F=DLLA145S847', N'TOBERA DLL145S73F=DLLA145S847', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (43, N'SP-09582', N'EMBOLO DE BOMBA DE ALIMENTACION', N'EMBOLO DE BOMBA DE ALIMENTACION', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(51.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (44, N'SP-09583', N'RETEN', N'RETEN', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (45, N'SP-09598', N'KIT DE GOBERNADOR DE BOMBAS RFD', N'KIT DE GOBERNADOR DE BOMBAS RFD', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (46, N'SP-09610', N'RETEN DE BOCINA PARA MITSUB 4D32', N'RETEN DE BOCINA PARA MITSUB 4D32', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (47, N'SP-09667', N'KIT DE CAJA PARA ELEMENTOS BRIDA', N'KIT DE CAJA PARA ELEMENTOS BRIDA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(31.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (48, N'SP-09679', N'BOCINA DE EJE DE STOP', N'BOCINA DE EJE DE STOP', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(43.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (49, N'SP-09710', N'KIT CON 2RETENES,1RODAJE,1BOCINA', N'KIT CON 2RETENES,1RODAJE,1BOCINA', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(53.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (50, N'SP-09725', N'KIT DE BOMBA VE 17MM', N'KIT DE BOMBA VE 17MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (51, N'SP-11004', N'ESPACIADOR DE COJINETE', N'ESPACIADOR DE COJINETE', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (52, N'SP-11126', N'KIT DE CAJA / BOMBA C/ ELEMEN TIPO P VOLVO', N'KIT DE CAJA / BOMBA C/ ELEMEN TIPO P VOLVO', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(52.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (53, N'SP-11189', N'LAINA DE ACOPLE', N'LAINA DE ACOPLE', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (54, N'SP-11448', N'EXENTRICA C/PALETA DPC', N'EXENTRICA C/PALETA DPC', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (55, N'SP-11666', N'SUPER KIT 4 EN 1', N'SUPER KIT 4 EN 1', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (56, N'SP-11733', N'BOCINA DE 20MM', N'BOCINA DE 20MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (57, N'SP-11811', N'RETEN DE 17MMX28 MM', N'RETEN DE 17MMX28 MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (58, N'SP-11812', N'RETEN DE 31MM', N'RETEN DE 31MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (59, N'SP-11839', N'KIT DE GOBERNADOR DE BOMBAS R801', N'KIT DE GOBERNADOR DE BOMBAS R801', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (60, N'SP-11844', N'KIT DE GOBERNADOR DE BOMBAS R901', N'KIT DE GOBERNADOR DE BOMBAS R901', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (61, N'SP-11855', N'ORING DE TAPA DE PERKING T6', N'ORING DE TAPA DE PERKING T6', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (62, N'SP-11883', N'EJE DE ACELERACION 770P', N'EJE DE ACELERACION 770P', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (63, N'SP-11979', N'RETEN DE 20MMX30MM', N'RETEN DE 20MMX30MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (64, N'SP-12002', N'LAINA ESPACIADORA DE 1.60MM', N'LAINA ESPACIADORA DE 1.60MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (65, N'SP-12004', N'LAINA ESPACIADORA DE 1.70MM', N'LAINA ESPACIADORA DE 1.70MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (66, N'SP-12006', N'LAINA ESPACIADORA DE 1.80MM', N'LAINA ESPACIADORA DE 1.80MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (67, N'SP-12008', N'LAINA ESPACIADORA DE 1.85MM', N'LAINA ESPACIADORA DE 1.85MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (68, N'SP-12009', N'LAINA ESPACIADORA DE 1.90MM', N'LAINA ESPACIADORA DE 1.90MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (69, N'SP-12010', N'LAINA ESPACIADORA DE 2.00MM', N'LAINA ESPACIADORA DE 2.00MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (70, N'SP-12012', N'LAINA ESPACIADORA DE 2.10MM', N'LAINA ESPACIADORA DE 2.10MM', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (71, N'SP-12086', N'RETEN PARA BOMBA DP210KRICK', N'RETEN PARA BOMBA DP210KRICK', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (72, N'SP-12123', N'KIT DE GOBERNADOR RQV C/TOPES GRANDES', N'KIT DE GOBERNADOR RQV C/TOPES GRANDES', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (73, N'SP-12565', N'VALVULA DE RETENCION', N'VALVULA DE RETENCION', 1, CAST(53.3333 AS Decimal(18, 4)), CAST(80.0000 AS Decimal(18, 4)), CAST(58.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (74, N'BB-0001', N'BOLSA ', N'BOLSA ', 1, CAST(0.0533 AS Decimal(18, 4)), CAST(0.0800 AS Decimal(18, 4)), CAST(500.0000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
INSERT [dbo].[Producto] ([Id], [Codigo], [Descripcion], [NombreComercial], [IdMarca], [PrecioVenta], [PrecioCompra], [Stock], [IdUnidadMedida], [FecCreacion], [Activo]) VALUES (75, N'BBBB02', N'BOLSA PEQUEÑA', N'BOLSA PEQUEÑA', 1, CAST(0.0053 AS Decimal(18, 4)), CAST(0.0080 AS Decimal(18, 4)), CAST(0.1000 AS Decimal(18, 4)), 57, CAST(N'2022-06-10T09:53:22.940' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([Id], [Documento], [RazonSocial], [Apellido], [Nombre], [Telefono], [Direccion], [FecIngreso], [Activo]) VALUES (1, N'10123456780', N'EMPRESA SAC', N' ', N'', N'963333281', N'TRUJILLO', CAST(N'2022-06-10T09:40:55.917' AS DateTime), 1)
INSERT [dbo].[Proveedor] ([Id], [Documento], [RazonSocial], [Apellido], [Nombre], [Telefono], [Direccion], [FecIngreso], [Activo]) VALUES (2, N'20989834451', N'TRUJILLO MOTORS', N' ', N'', N'963333281', N'TRUJILLO ', CAST(N'2022-06-10T09:40:55.917' AS DateTime), 1)
INSERT [dbo].[Proveedor] ([Id], [Documento], [RazonSocial], [Apellido], [Nombre], [Telefono], [Direccion], [FecIngreso], [Activo]) VALUES (3, N'20987654341', N'PERU MOTOS SAC', N' ', N'', N'987345123', N'TRUJILLO ', CAST(N'2022-06-10T09:40:55.917' AS DateTime), 1)
INSERT [dbo].[Proveedor] ([Id], [Documento], [RazonSocial], [Apellido], [Nombre], [Telefono], [Direccion], [FecIngreso], [Activo]) VALUES (4, N'20987645561', N'PERU TRUJILLO MOTORS', N' ', N'', N'963333281', N'TRUJILLO', CAST(N'2022-06-10T09:40:55.917' AS DateTime), 1)
INSERT [dbo].[Proveedor] ([Id], [Documento], [RazonSocial], [Apellido], [Nombre], [Telefono], [Direccion], [FecIngreso], [Activo]) VALUES (5, N'44050058', N'', N'Vilchez Quispe', N'Francisco Antonio', N'', N'', CAST(N'2022-06-10T09:40:55.917' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[UnidadMedida] ON 

INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (1, N'4A', N'BOBINAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (2, N'BJ', N'BALDE', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (3, N'BLL', N'BARRILES', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (4, N'BG', N'BOLSA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (5, N'BO', N'BOTELLAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (6, N'BX', N'CAJA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (7, N'CT', N'CARTONES', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (8, N'CMK', N'CENTIMETRO CUADRADO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (9, N'CMQ', N'CENTIMETRO CUBICO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (10, N'CMT', N'CENTIMETRO LINEAL', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (11, N'CEN', N'CIENTO DE UNIDADES', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (12, N'CY', N'CILINDRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (13, N'CJ', N'CONOS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (14, N'DZN', N'DOCENA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (15, N'DZP', N'DOCENA POR 10**6', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (16, N'BE', N'FARDO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (17, N'GRM', N'GRAMO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (18, N'GRO', N'GRUESA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (19, N'HLT', N'HECTOLITRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (20, N'LEF', N'HOJA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (21, N'SET', N'JUEGO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (22, N'KGM', N'KILOGRAMO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (23, N'KTM', N'KILOMETRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (24, N'KWH', N'KILOVATIO HORA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (25, N'KT', N'KIT', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (26, N'CA', N'LATAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (27, N'LBR', N'LIBRAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (28, N'LTR', N'LITRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (29, N'MWH', N'MEGAWATT HORA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (30, N'MTR', N'METRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (31, N'MTK', N'METRO CUADRADO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (32, N'MTQ', N'METRO CUBICO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (33, N'MGM', N'MILIGRAMOS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (34, N'MLT', N'MILILITRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (35, N'MMT', N'MILIMETRO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (36, N'MMK', N'MILIMETRO CUADRADO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (37, N'MMQ', N'MILIMETRO CUBICO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (38, N'MIL', N'MILLARES', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (39, N'UM', N'MILLON DE UNIDADES', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (40, N'ONZ', N'ONZAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (41, N'PF', N'PALETAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (42, N'PK', N'PAQUETE', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (43, N'PR', N'PAR', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (44, N'FOT', N'PIES', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (45, N'FTK', N'PIES CUADRADOS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (46, N'FTQ', N'PIES CUBICOS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (47, N'C62', N'PIEZAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (48, N'PG', N'PLACAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (49, N'ST', N'PLIEGO', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (50, N'INH', N'PULGADAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (51, N'RM', N'RESMA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (52, N'DR', N'TAMBOR', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (53, N'STN', N'TONELADA CORTA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (54, N'LTN', N'TONELADA LARGA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (55, N'TNE', N'TONELADAS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (56, N'TU', N'TUBOS', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (57, N'NIU', N'UNIDAD (BIENES)', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (58, N'ZZ', N'UNIDAD (SERVICIOS) ', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (59, N'GLL', N'US GALON (3,7843 L)', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (60, N'YRD', N'YARDA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (61, N'YDK', N'YARDA CUADRADA', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
INSERT [dbo].[UnidadMedida] ([Id], [Codigo], [Descripcion], [FecCreacion], [Activo]) VALUES (62, N'GLI', N'GALON INGLES (4,545956L)', CAST(N'2022-06-10T09:11:17.610' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UnidadMedida] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [CodTrabajador], [Nombres], [Apellidos], [Clave], [FecIngreso], [Aleas], [Activo]) VALUES (1, N'96475845', N'EDGAR', N'CALDERON', N'ygsyW16AKu9wCwfDG1dKDA==', CAST(N'2022-06-10T09:22:19.803' AS DateTime), N'ECALDERON', 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [CodTrabajador], [Nombres], [Apellidos], [Clave], [FecIngreso], [Aleas], [Activo]) VALUES (2, N'21457855', N'CARLA', N'RAMOS', N'ygsyW16AKu9wCwfDG1dKDA==', CAST(N'2022-06-10T09:22:19.803' AS DateTime), N'MMILAGROS', 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [CodTrabajador], [Nombres], [Apellidos], [Clave], [FecIngreso], [Aleas], [Activo]) VALUES (3, N'64578417', N'HENRY', N'CHAVEZ', N'ygsyW16AKu9wCwfDG1dKDA==', CAST(N'2022-06-10T09:22:19.803' AS DateTime), N'HCHAVEZ', 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [CodTrabajador], [Nombres], [Apellidos], [Clave], [FecIngreso], [Aleas], [Activo]) VALUES (4, N'33443345', N'julio', N'gonzales', N'ygsyW16AKu9wCwfDG1dKDA==', CAST(N'2022-06-10T09:22:19.803' AS DateTime), N'jgonzales', 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [CodTrabajador], [Nombres], [Apellidos], [Clave], [FecIngreso], [Aleas], [Activo]) VALUES (5, N'44050058', N'Francisco Antonio', N'Vilchez Quispe', N'ygsyW16AKu9wCwfDG1dKDA==', CAST(N'2022-06-10T09:34:20.480' AS DateTime), N'FVILCHEZ', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compra] ([Id])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Compra]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Producto]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_UnidadMedida] FOREIGN KEY([IdUnidadMedida])
REFERENCES [dbo].[UnidadMedida] ([Id])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_UnidadMedida]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_UnidadMedida] FOREIGN KEY([IdUnidadMedida])
REFERENCES [dbo].[UnidadMedida] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_UnidadMedida]
GO
/****** Object:  StoredProcedure [dbo].[ListarComprasPorUsuario]    Script Date: 11/06/2022 07:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ListarComprasPorUsuario]

@Id bigint

As

BEGIN TRANSACTION 
	BEGIN TRY
	Select * from Compra  where idusuario=@Id;

	/* Confirmamos la transaccion*/
	COMMIT TRANSACTION 
	
	END TRY

BEGIN CATCH

/* Ocurrió un error, deshacemos los cambios*/ 
ROLLBACK TRANSACTION
 SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
PRINT 'Ha ocurrido un error!'

END CATCH
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bo:Boleta,Fa:Factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'TipoComprobante'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E:efectivo,T:tarjeta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'MedioPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CT:contado,CR:credito' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'CondicionPago'
GO
USE [master]
GO
ALTER DATABASE [BDApiRest] SET  READ_WRITE 
GO
