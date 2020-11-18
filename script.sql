USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Drogas]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[FormasFarmaceuticas]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Laboratorios]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Localidades]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Lotes]    Script Date: 17/11/2020 21:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lotes](
	[LoteId] [int] IDENTITY(1,1) NOT NULL,
	[MedicamentoId] [int] NOT NULL,
	[Identificacion] [nvarchar](10) NOT NULL,
	[FechaDeIngreso] [date] NOT NULL,
	[Vencimiento] [nvarchar](4) NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Lotes] PRIMARY KEY CLUSTERED 
(
	[LoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[ObrasSociales]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[Provincias]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[TiposDeDocumentos]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[TiposDeIngredientes]    Script Date: 17/11/2020 21:32:35 ******/
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
/****** Object:  Table [dbo].[TiposDeMedicamentos]    Script Date: 17/11/2020 21:32:35 ******/
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
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (1, N'Alexis Bahiano', N'Paoletti', 1, N'43.045.364', N'calle 12', 5, 1, N'494482', N'2227-670103', N'baypaoletti@gmail.com')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Apellido], [TipoDeDocumentoId], [NroDocumento], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico]) VALUES (4, N'Juan', N'Perez', 1, N'30.234.245', N'Belgrano 665', 4, 1, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[Drogas] ON 

INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (2, N'Ibuprofeno')
INSERT [dbo].[Drogas] ([DrogaId], [NombreDroga]) VALUES (5, N'Amoxicilina')
SET IDENTITY_INSERT [dbo].[Drogas] OFF
SET IDENTITY_INSERT [dbo].[FormasFarmaceuticas] ON 

INSERT [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId], [Descripcion]) VALUES (1, N'Jarabe')
INSERT [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId], [Descripcion]) VALUES (4, N'Comprimidos')
INSERT [dbo].[FormasFarmaceuticas] ([FormaFarmaceuticaId], [Descripcion]) VALUES (5, N'Grajeas')
SET IDENTITY_INSERT [dbo].[FormasFarmaceuticas] OFF
SET IDENTITY_INSERT [dbo].[Laboratorios] ON 

INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (3, N'Biotenk')
INSERT [dbo].[Laboratorios] ([LaboratorioId], [NombreLaboratorio]) VALUES (4, N'Elisium S.A.')
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

INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (2, N'Adermicina', 2, 4, 4, 3, CAST(100.00 AS Numeric(18, 2)), 500, 10, N'8', 0)
INSERT [dbo].[Medicamentos] ([MedicamentoId], [NombreComercial], [DrogaId], [TipoDeMedicamentoId], [FormaFarmaceuticaId], [LaboratorioId], [PrecioVenta], [UnidadesEnStok], [NivelDeReposicion], [CantidadesPorUnidad], [Suspendido]) VALUES (3, N'Resaquit', 5, 5, 5, 4, CAST(60.00 AS Numeric(18, 2)), 200, 8, N'1', 1)
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
SET IDENTITY_INSERT [dbo].[ObrasSociales] ON 

INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (4, N'IOMA', CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[ObrasSociales] ([ObraSocialId], [NombreObraSocial], [PorcentajeDeDescuento]) VALUES (5, N'PAMI', CAST(15.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[ObrasSociales] OFF
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (1002, N'20-43045364-6', N'Bahiano', N'Pedro', N'calle 1', 5, 1, N'421734', N'2227-425262', N'pedro20@gmail.com', 1003)
INSERT [dbo].[Proveedores] ([ProveedorId], [CUIT], [RazonSocial], [PersonaDeContacto], [Direccion], [LocalidadId], [ProvinciaId], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [TipoDeIngredienteId]) VALUES (1004, N'21-24385635-7', N'Panda', N'Sofia', N'calle 10', 6, 1, N'', N'', N'', 1004)
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
SET IDENTITY_INSERT [dbo].[TiposDeIngredientes] OFF
SET IDENTITY_INSERT [dbo].[TiposDeMedicamentos] ON 

INSERT [dbo].[TiposDeMedicamentos] ([TipoDeMedicamentoId], [Descripcion]) VALUES (4, N'Antibiotico')
INSERT [dbo].[TiposDeMedicamentos] ([TipoDeMedicamentoId], [Descripcion]) VALUES (5, N'Antiinflamatorio')
SET IDENTITY_INSERT [dbo].[TiposDeMedicamentos] OFF
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
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
