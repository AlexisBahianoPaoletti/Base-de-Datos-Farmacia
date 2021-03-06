USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 19/02/2021 23:08:29 ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Farmacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Farmacia', N'ON'
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = OFF
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[TipoDeDocumentoId] [int] NOT NULL,
	[NroDocumento] [nvarchar](10) NOT NULL,
	[Direccion] [nvarchar](100) NOT NULL,
	[LocalidadId] [int] NOT NULL,
	[ProvinciaId] [int] NOT NULL,
	[TelefonoFijo] [nvarchar](20) NULL,
	[TelefonoMovil] [nvarchar](20) NULL,
	[CorreoElectronico] [nvarchar](150) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientesObrasSociales]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesObrasSociales](
	[ClienteId] [int] NOT NULL,
	[ObraSocialId] [int] NOT NULL,
 CONSTRAINT [PK_ClientesObrasSociales] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC,
	[ObraSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[CompraId] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[CompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprasMedicamentos]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprasMedicamentos](
	[CompraId] [int] NOT NULL,
	[MedicamentoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_ComprasMedicamentos] PRIMARY KEY CLUSTERED 
(
	[CompraId] ASC,
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drogas]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drogas](
	[DrogaId] [int] IDENTITY(1,1) NOT NULL,
	[NombreDroga] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Drogas] PRIMARY KEY CLUSTERED 
(
	[DrogaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormasFarmaceuticas]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormasFarmaceuticas](
	[FormaFarmaceuticaId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormasFarmaceuticas] PRIMARY KEY CLUSTERED 
(
	[FormaFarmaceuticaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorios]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorios](
	[LaboratorioId] [int] IDENTITY(1,1) NOT NULL,
	[NombreLaboratorio] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Laboratorios] PRIMARY KEY CLUSTERED 
(
	[LaboratorioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[LocalidadId] [int] IDENTITY(1,1) NOT NULL,
	[NombreLocalidad] [nvarchar](100) NOT NULL,
	[ProvinciaId] [int] NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[LocalidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lotes]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lotes](
	[LoteId] [int] IDENTITY(1,1) NOT NULL,
	[MedicamentoId] [int] NOT NULL,
	[Identificacion] [nvarchar](10) NOT NULL,
	[FechaDeIngreso] [date] NOT NULL,
	[Vencimiento] [nvarchar](5) NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Lotes] PRIMARY KEY CLUSTERED 
(
	[LoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[MedicamentoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreComercial] [nvarchar](100) NOT NULL,
	[DrogaId] [int] NOT NULL,
	[TipoDeMedicamentoId] [int] NOT NULL,
	[FormaFarmaceuticaId] [int] NOT NULL,
	[LaboratorioId] [int] NOT NULL,
	[PrecioVenta] [numeric](18, 2) NOT NULL,
	[UnidadesEnStok] [int] NOT NULL,
	[NivelDeReposicion] [int] NOT NULL,
	[CantidadesPorUnidad] [nvarchar](50) NOT NULL,
	[Suspendido] [bit] NOT NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSociales]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSociales](
	[ObraSocialId] [int] IDENTITY(1,1) NOT NULL,
	[NombreObraSocial] [nvarchar](100) NOT NULL,
	[PorcentajeDeDescuento] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_ObrasSociales] PRIMARY KEY CLUSTERED 
(
	[ObraSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[CUIT] [nvarchar](13) NOT NULL,
	[RazonSocial] [nvarchar](100) NOT NULL,
	[PersonaDeContacto] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](100) NOT NULL,
	[LocalidadId] [int] NOT NULL,
	[ProvinciaId] [int] NOT NULL,
	[TelefonoFijo] [nvarchar](20) NULL,
	[TelefonoMovil] [nvarchar](20) NULL,
	[CorreoElectronico] [nvarchar](150) NULL,
	[TipoDeIngredienteId] [int] NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[ProvinciaId] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeDocumentos]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeDocumentos](
	[TipoDeDocumentoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TiposDeDocumentos] PRIMARY KEY CLUSTERED 
(
	[TipoDeDocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeIngredientes]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeIngredientes](
	[TipoDeIngredienteId] [int] IDENTITY(1,1) NOT NULL,
	[TipoDeIngrediente] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TiposDeIngredientes] PRIMARY KEY CLUSTERED 
(
	[TipoDeIngredienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeMedicamentos]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeMedicamentos](
	[TipoDeMedicamentoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposDeMedicamentos] PRIMARY KEY CLUSTERED 
(
	[TipoDeMedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[PrecioTotal] [numeric](18, 2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[VentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentasMedicamentos]    Script Date: 19/02/2021 23:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentasMedicamentos](
	[VentaId] [int] NOT NULL,
	[MedicamentoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_VentasMedicamentos] PRIMARY KEY CLUSTERED 
(
	[VentaId] ASC,
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1, N'Alexis Bahiano', N'Paoletti', 1, N'43.045.364', N'calle 12', 5, 1, N'494482', N'2227-670103', N'baypaoletti@gmail.com')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (4, N'Juan', N'Perez', 1, N'30.234.245', N'Belgrano 665', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1003, N'Nicolas', N'Torrado', 1, N'34.425.452', N'32', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1004, N'Juan', N'Garcia', 1, N'20.645.369', N'calle 7', 4, 1, N'', N'2227-542378', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1005, N'Xiomara', N'Fernandez', 1, N'34.342.875', N'calle 89', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1006, N'Luciana', N'Alarcon', 1, N'42.568.837', N'calle 56', 4, 1, N'', N'', N'lu_22@gmail.com')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1007, N'Brenda', N'Paolini', 1, N'44.274.983', N'calle 2', 5, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1008, N'Jose', N'Perez', 1, N'12.374.294', N'calle 72', 6, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1009, N'Julian', N'Cuesta', 1, N'35.879.154', N'123 avellaneda', 5, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1010, N'Gabriel', N'Garcia', 1, N'45.235.789', N'23 Pavon', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1011, N'Juana', N'Almiron', 1, N'32.746.387', N'calle 20', 5, 1, N'494364', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1012, N'Milagros', N'Echave', 1, N'23.674.836', N'calle 87', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1013, N'Rafaela', N'Zalazar', 1, N'43.245.231', N'calle 33', 4, 1, N'', N'2227-598143', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1014, N'Celeste', N'Gonzalez', 1, N'24.847.372', N'calle 66', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1015, N'Agustin', N'Galotto', 1, N'10.345.745', N'calle 34', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1016, N'Serena', N'Moyano', 1, N'47.284.839', N'calle 8', 5, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1017, N'Maria', N'Herrera', 1, N'34.381.374', N'calle 2', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1018, N'Micaela', N'Tovo', 1, N'32.423.246', N'calle 45', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1019, N'Melina', N'Araujo', 1, N'43.245.624', N'calle 34', 4, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1020, N'Fiama', N'Pais', 1, N'42.846.392', N'calle 21', 5, 1, N'', N'', N'')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1021, N'Guadalupe', N'Corvalan', 1, N'34.264.284', N'calle 44', 6, 1, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1, 4)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1, 5)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1, 1006)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1003, 1005)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1004, 1008)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1005, 1008)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1006, 1017)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1008, 5)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1010, 1013)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1011, 1012)
INSERT [dbo].[ClientesObrasSociales] ([ClienteId], [ObraSocialId]) VALUES (1012, 1013)
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (3, 1002, CAST(N'2021-02-11T23:30:35.870' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (4, 1004, CAST(N'2021-02-11T23:31:06.747' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (5, 1002, CAST(N'2021-02-11T23:34:43.607' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (6, 1002, CAST(N'2021-02-11T23:39:03.450' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (11, 1002, CAST(N'2021-02-13T19:49:09.557' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (12, 1002, CAST(N'2021-02-13T19:50:20.580' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (13, 1004, CAST(N'2021-02-15T17:28:35.173' AS DateTime))
INSERT [dbo].[Compras] ([CompraId], [ProveedorId], [Fecha]) VALUES (14, 2002, CAST(N'2021-02-15T17:32:54.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[Compras] OFF
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (3, 2, 100, CAST(10000.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (3, 3, 100, CAST(6000.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (4, 2, 50, CAST(5000.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (5, 2, 100, CAST(10000.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (6, 3, 100, CAST(6000.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (11, 2, 7, CAST(700.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (12, 2, 5, CAST(500.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (13, 2, 10, CAST(1000.00 AS Numeric(18, 2)))
INSERT [dbo].[ComprasMedicamentos] ([CompraId], [MedicamentoId], [Cantidad], [Precio]) VALUES (14, 2, 750, CAST(75000.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[Drogas] ON 

INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (2, N'Ibuprofeno')
INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (5, N'Amoxicilina')
INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (1005, N'OxyContin')
INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (1006, N'Vicarbonato')
INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (1007, N'Azufre')
SET IDENTITY_INSERT [dbo].[Drogas] OFF
SET IDENTITY_INSERT [dbo].[FormasFarmaceuticas] ON 

INSERT [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId], [Descripcion]) VALUES (1, N'Jarabe')
INSERT [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId], [Descripcion]) VALUES (4, N'Comprimidos')
INSERT [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId], [Descripcion]) VALUES (5, N'Grajeas')
SET IDENTITY_INSERT [dbo].[FormasFarmaceuticas] OFF
SET IDENTITY_INSERT [dbo].[Laboratorios] ON 

INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (3, N'Biotenk')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (4, N'Elisium S.A.')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1004, N'Laboratorio RP')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1005, N'Gantry 5')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1006, N'Novartis')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1007, N'GSK')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1008, N'Laboratorio SM')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1009, N'Pfizer')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1010, N'Sanofi')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1011, N'Novartis S. A.')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1012, N'Roche')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1013, N'Emothia')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (1014, N'Celico')
SET IDENTITY_INSERT [dbo].[Laboratorios] OFF
SET IDENTITY_INSERT [dbo].[Localidades] ON 

INSERT [dbo].[Localidades] ([LocalidadId], [NombreLocalidad], [ProvinciaId]) VALUES (4, N'Lobos', 1)
INSERT [dbo].[Localidades] ([LocalidadId], [NombreLocalidad], [ProvinciaId]) VALUES (5, N'Salvador María', 1)
INSERT [dbo].[Localidades] ([LocalidadId], [NombreLocalidad], [ProvinciaId]) VALUES (6, N'Roque Perez', 1)
SET IDENTITY_INSERT [dbo].[Localidades] OFF
SET IDENTITY_INSERT [dbo].[Lotes] ON 

INSERT [dbo].[Lotes] ([LoteId], [MedicamentoId], [Identificacion], [FechaDeIngreso], [Vencimiento], [Cantidad]) VALUES (2, 2, N'ABD', CAST(N'2019-11-20' AS Date), N'2024', 100)
INSERT [dbo].[Lotes] ([LoteId], [MedicamentoId], [Identificacion], [FechaDeIngreso], [Vencimiento], [Cantidad]) VALUES (3, 3, N'ABC', CAST(N'2019-12-20' AS Date), N'2023', 100)
SET IDENTITY_INSERT [dbo].[Lotes] OFF
SET IDENTITY_INSERT [dbo].[Medicamentos] ON 

INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2, N'Adermicina', 2, 4, 4, 3, CAST(100.00 AS Numeric(18, 2)), 700, 10, N'8', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (3, N'Resaquit', 5, 5, 5, 4, CAST(60.00 AS Numeric(18, 2)), 400, 8, N'1', 1)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1002, N'Frenix', 1005, 4, 1, 3, CAST(30.00 AS Numeric(18, 2)), 1000, 5, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1003, N'Lutex', 1006, 5, 1, 1013, CAST(105.00 AS Numeric(18, 2)), 1080, 4, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1004, N'sorrott', 1007, 4, 4, 1014, CAST(80.00 AS Numeric(18, 2)), 1, 10, N'1', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1005, N'gripex', 5, 5, 4, 1012, CAST(40.00 AS Numeric(18, 2)), 300, 1, N'3', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1006, N'Dobet', 2, 5, 4, 1007, CAST(70.00 AS Numeric(18, 2)), 800, 5, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1007, N'Martesia', 5, 4, 1, 1008, CAST(500.00 AS Numeric(18, 2)), 700, 3, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1008, N'Salbutamol', 2, 5, 5, 1011, CAST(400.00 AS Numeric(18, 2)), 400, 3, N'8', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1009, N'Levotiroxina', 2, 5, 1, 1004, CAST(600.00 AS Numeric(18, 2)), 600, 5, N'6', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1010, N'daflon', 5, 5, 4, 1005, CAST(450.00 AS Numeric(18, 2)), 8000, 10, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1011, N'tramadol', 1006, 4, 1, 1006, CAST(320.00 AS Numeric(18, 2)), 500, 4, N'9', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1012, N'Valsaten', 2, 4, 4, 1006, CAST(590.00 AS Numeric(18, 2)), 369, 4, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1013, N'Eutirox', 5, 4, 4, 4, CAST(200.00 AS Numeric(18, 2)), 850, 3, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1014, N'Ceudomi', 1005, 5, 4, 4, CAST(403.00 AS Numeric(18, 2)), 544, 4, N'2', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (1015, N'Diosomina', 1005, 4, 4, 1007, CAST(766.00 AS Numeric(18, 2)), 300, 5, N'6', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2002, N'Carbidopa', 1006, 5, 1, 3, CAST(60.00 AS Numeric(18, 2)), 1000, 7, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2003, N'Levodopa', 2, 4, 4, 3, CAST(700.00 AS Numeric(18, 2)), 400, 4, N'2', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2004, N'yaz', 1005, 5, 4, 3, CAST(488.00 AS Numeric(18, 2)), 889, 6, N'3', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2005, N'Pentoxi', 1005, 4, 4, 4, CAST(309.00 AS Numeric(18, 2)), 300, 1, N'12', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2006, N'Matilol', 1006, 4, 5, 4, CAST(300.00 AS Numeric(18, 2)), 799, 5, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2007, N'alfadyn', 1007, 5, 4, 1004, CAST(200.00 AS Numeric(18, 2)), 577, 4, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2008, N'drozop', 5, 4, 1, 1004, CAST(200.00 AS Numeric(18, 2)), 600, 2, N'8', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2009, N'Pentoxifilina', 5, 5, 5, 1004, CAST(120.00 AS Numeric(18, 2)), 1000, 4, N'3', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2010, N'latanox', 1006, 4, 4, 1005, CAST(837.00 AS Numeric(18, 2)), 400, 7, N'4', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2011, N'Kenacort', 1006, 4, 4, 1005, CAST(305.00 AS Numeric(18, 2)), 793, 4, N'2', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2012, N'Liolactil', 1005, 4, 4, 1005, CAST(600.00 AS Numeric(18, 2)), 344, 9, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2013, N'Diosinima', 1007, 4, 1, 1006, CAST(745.00 AS Numeric(18, 2)), 85, 6, N'4', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2014, N'calox', 5, 4, 5, 1006, CAST(380.00 AS Numeric(18, 2)), 467, 5, N'8', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2015, N'DAKSOL', 1005, 5, 1, 1007, CAST(600.00 AS Numeric(18, 2)), 466, 7, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2016, N'Bumetin', 2, 5, 1, 1007, CAST(347.00 AS Numeric(18, 2)), 240, 3, N'6', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2017, N'Neurixa', 2, 5, 4, 1008, CAST(350.00 AS Numeric(18, 2)), 290, 4, N'9', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2018, N'Arudil', 1006, 5, 5, 1008, CAST(900.00 AS Numeric(18, 2)), 390, 2, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2019, N'Nifedipina', 2, 5, 5, 1009, CAST(85.00 AS Numeric(18, 2)), 760, 5, N'2', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2020, N'sinovul', 1005, 5, 4, 1009, CAST(200.00 AS Numeric(18, 2)), 350, 9, N'5', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2021, N'Carvedilo', 5, 5, 4, 1010, CAST(359.00 AS Numeric(18, 2)), 589, 3, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2022, N'Diaformina', 1007, 5, 5, 1011, CAST(522.00 AS Numeric(18, 2)), 500, 5, N'7 ', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2023, N'ULCON', 1005, 4, 1, 1011, CAST(837.00 AS Numeric(18, 2)), 566, 4, N'6', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2024, N'Madopar', 5, 4, 4, 1010, CAST(200.00 AS Numeric(18, 2)), 390, 4, N'4', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2025, N'Gabapetina', 5, 4, 1, 1012, CAST(300.00 AS Numeric(18, 2)), 800, 3, N'6', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2026, N'Lavotiroxina', 1006, 4, 4, 1012, CAST(500.00 AS Numeric(18, 2)), 390, 6, N'3', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2027, N'Varteral', 1005, 4, 4, 1013, CAST(560.00 AS Numeric(18, 2)), 900, 5, N'7', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2028, N'Edagan', 5, 4, 1, 1014, CAST(900.00 AS Numeric(18, 2)), 463, 6, N'2', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2029, N'Tramacadol', 1005, 5, 4, 1014, CAST(568.00 AS Numeric(18, 2)), 488, 5, N'8', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2030, N'Mitazabal', 5, 5, 4, 1013, CAST(688.00 AS Numeric(18, 2)), 788, 5, N'2', 0)
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
SET IDENTITY_INSERT [dbo].[ObrasSociales] ON 

INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (4, N'IOMA', CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (5, N'PAMI', CAST(15.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1005, N'Osecac', CAST(12.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1006, N'Union Personal', CAST(14.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1007, N'OSCA', CAST(20.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1008, N'OSPE', CAST(15.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1009, N'IOSE', CAST(18.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1010, N'Medife', CAST(22.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1011, N'OSDIPP', CAST(25.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1012, N'OSPIT', CAST(8.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1013, N'Galeno', CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1014, N'Boreal', CAST(21.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1015, N'AsisMed', CAST(11.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1016, N'RED', CAST(20.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1017, N'PrevencionSalud', CAST(15.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1018, N'Jerarquicos', CAST(6.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1019, N'NOBIS', CAST(22.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (1020, N'SME', CAST(14.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[ObrasSociales] OFF
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (1002, N'20-43045364-6', N'Bahiano', N'Pedro', N'calle 1', 5, 1, N'421734', N'2227-425262', N'pedro20@gmail.com', 1003)
INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (1004, N'21-24385635-7', N'Panda', N'Sofia', N'calle 10', 6, 1, N'', N'', N'', 1004)
INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (2002, N'21-23453487-7', N'NICK', N'Piluso', N'calle 6', 5, 1, N'421684', N'2227894532', N'', 2005)
INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (2003, N'21-89564328-9', N'Sic', N'Pancho', N'calle 3', 6, 1, N'', N'', N'', 2004)
INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (2004, N'21-23895434-3', N'Verde', N'Pichuco', N'calle 7', 5, 1, N'', N'2227894489', N'pichu@gmail.com', 1003)
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (3, N'Córdoba')
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (4, N'Santa Fe')
SET IDENTITY_INSERT [dbo].[Provincias] OFF
SET IDENTITY_INSERT [dbo].[TiposDeDocumentos] ON 

INSERT [dbo].[TiposDeDocumentos] ([TipoDeDocumentoId], [Descripcion]) VALUES (1, N'D.N.I')
INSERT [dbo].[TiposDeDocumentos] ([TipoDeDocumentoId], [Descripcion]) VALUES (3, N'Libreta de enrrolamiento')
SET IDENTITY_INSERT [dbo].[TiposDeDocumentos] OFF
SET IDENTITY_INSERT [dbo].[TiposDeIngredientes] ON 

INSERT [dbo].[TiposDeIngredientes] ([TipoDeIngredienteId], [TipoDeIngrediente]) VALUES (1003, N'Ampicilina')
INSERT [dbo].[TiposDeIngredientes] ([TipoDeIngredienteId], [TipoDeIngrediente]) VALUES (1004, N'Claritromicina')
INSERT [dbo].[TiposDeIngredientes] ([TipoDeIngredienteId], [TipoDeIngrediente]) VALUES (2003, N'Tranquilin')
INSERT [dbo].[TiposDeIngredientes] ([TipoDeIngredienteId], [TipoDeIngrediente]) VALUES (2004, N'Canavis')
INSERT [dbo].[TiposDeIngredientes] ([TipoDeIngredienteId], [TipoDeIngrediente]) VALUES (2005, N'Miel')
SET IDENTITY_INSERT [dbo].[TiposDeIngredientes] OFF
SET IDENTITY_INSERT [dbo].[TiposDeMedicamentos] ON 

INSERT [dbo].[TiposDeMedicamentos] ([TipoDeMedicamentoId], [Descripcion]) VALUES (4, N'Antibiotico')
INSERT [dbo].[TiposDeMedicamentos] ([TipoDeMedicamentoId], [Descripcion]) VALUES (5, N'Antiinflamatorio')
SET IDENTITY_INSERT [dbo].[TiposDeMedicamentos] OFF
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [PrecioTotal], [Fecha]) VALUES (1, 4, CAST(1300.00 AS Numeric(18, 2)), CAST(N'2021-02-15T17:29:27.337' AS DateTime))
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [PrecioTotal], [Fecha]) VALUES (2, 4, CAST(1300.00 AS Numeric(18, 2)), CAST(N'2021-02-15T17:29:51.240' AS DateTime))
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [PrecioTotal], [Fecha]) VALUES (3, 1, CAST(221.00 AS Numeric(18, 2)), CAST(N'2021-02-15T17:30:32.440' AS DateTime))
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [PrecioTotal], [Fecha]) VALUES (4, 1, CAST(88400.00 AS Numeric(18, 2)), CAST(N'2021-02-15T17:31:40.373' AS DateTime))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
INSERT [dbo].[VentasMedicamentos] ([VentaId], [MedicamentoId], [Cantidad], [Precio]) VALUES (1, 2, 10, CAST(1300.00 AS Numeric(18, 2)))
INSERT [dbo].[VentasMedicamentos] ([VentaId], [MedicamentoId], [Cantidad], [Precio]) VALUES (2, 2, 10, CAST(1300.00 AS Numeric(18, 2)))
INSERT [dbo].[VentasMedicamentos] ([VentaId], [MedicamentoId], [Cantidad], [Precio]) VALUES (3, 2, 2, CAST(260.00 AS Numeric(18, 2)))
INSERT [dbo].[VentasMedicamentos] ([VentaId], [MedicamentoId], [Cantidad], [Precio]) VALUES (4, 2, 800, CAST(104000.00 AS Numeric(18, 2)))
ALTER TABLE [dbo].[Medicamentos] ADD  CONSTRAINT [DF_Medicamentos_Suspendido]  DEFAULT ((0)) FOR [Suspendido]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Localidades1] FOREIGN KEY([LocalidadId])
REFERENCES [dbo].[Localidades] ([LocalidadId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Localidades1]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Provincias1] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincias] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Provincias1]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_TiposDeDocumentos1] FOREIGN KEY([TipoDeDocumentoId])
REFERENCES [dbo].[TiposDeDocumentos] ([TipoDeDocumentoId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_TiposDeDocumentos1]
GO
ALTER TABLE [dbo].[ClientesObrasSociales]  WITH CHECK ADD  CONSTRAINT [FK_ClientesObrasSociales_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[ClientesObrasSociales] CHECK CONSTRAINT [FK_ClientesObrasSociales_Clientes]
GO
ALTER TABLE [dbo].[ClientesObrasSociales]  WITH CHECK ADD  CONSTRAINT [FK_ClientesObrasSociales_ObrasSociales] FOREIGN KEY([ObraSocialId])
REFERENCES [dbo].[ObrasSociales] ([ObraSocialId])
GO
ALTER TABLE [dbo].[ClientesObrasSociales] CHECK CONSTRAINT [FK_ClientesObrasSociales_ObrasSociales]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Proveedores] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedores] ([ProveedorId])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Proveedores]
GO
ALTER TABLE [dbo].[ComprasMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_ComprasMedicamentos_Compras] FOREIGN KEY([CompraId])
REFERENCES [dbo].[Compras] ([CompraId])
GO
ALTER TABLE [dbo].[ComprasMedicamentos] CHECK CONSTRAINT [FK_ComprasMedicamentos_Compras]
GO
ALTER TABLE [dbo].[ComprasMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_ComprasMedicamentos_Medicamentos] FOREIGN KEY([MedicamentoId])
REFERENCES [dbo].[Medicamentos] ([MedicamentoId])
GO
ALTER TABLE [dbo].[ComprasMedicamentos] CHECK CONSTRAINT [FK_ComprasMedicamentos_Medicamentos]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincias] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Lotes]  WITH CHECK ADD  CONSTRAINT [FK_Lotes_Medicamentos1] FOREIGN KEY([MedicamentoId])
REFERENCES [dbo].[Medicamentos] ([MedicamentoId])
GO
ALTER TABLE [dbo].[Lotes] CHECK CONSTRAINT [FK_Lotes_Medicamentos1]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Drogas] FOREIGN KEY([DrogaId])
REFERENCES [dbo].[Drogas] ([DrogaId])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Drogas]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_FormasFarmaceuticas] FOREIGN KEY([FormaFarmaceuticaId])
REFERENCES [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_FormasFarmaceuticas]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Laboratorios] FOREIGN KEY([LaboratorioId])
REFERENCES [dbo].[Laboratorios] ([LaboratorioId])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Laboratorios]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_TiposDeMedicamentos1] FOREIGN KEY([TipoDeMedicamentoId])
REFERENCES [dbo].[TiposDeMedicamentos] ([TipoDeMedicamentoId])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_TiposDeMedicamentos1]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Localidades1] FOREIGN KEY([LocalidadId])
REFERENCES [dbo].[Localidades] ([LocalidadId])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Localidades1]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Provincias1] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincias] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Provincias1]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_TiposDeIngredientes] FOREIGN KEY([TipoDeIngredienteId])
REFERENCES [dbo].[TiposDeIngredientes] ([TipoDeIngredienteId])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_TiposDeIngredientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[VentasMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_VentasMedicamentos_Medicamentos] FOREIGN KEY([MedicamentoId])
REFERENCES [dbo].[Medicamentos] ([MedicamentoId])
GO
ALTER TABLE [dbo].[VentasMedicamentos] CHECK CONSTRAINT [FK_VentasMedicamentos_Medicamentos]
GO
ALTER TABLE [dbo].[VentasMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_VentasMedicamentos_Ventas] FOREIGN KEY([VentaId])
REFERENCES [dbo].[Ventas] ([VentaId])
GO
ALTER TABLE [dbo].[VentasMedicamentos] CHECK CONSTRAINT [FK_VentasMedicamentos_Ventas]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
