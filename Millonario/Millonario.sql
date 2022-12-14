USE [master]
GO
/****** Object:  Database [Millonario]    Script Date: 11/9/2022 17:13:01 ******/
CREATE DATABASE [Millonario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Millonario', FILENAME = N'C:\Users\46876761\Desktop\Thiago\MSSQL14.SQLEXPRESS\MSSQL\DATA\Millonario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Millonario_log', FILENAME = N'C:\Users\46876761\Desktop\Thiago\MSSQL14.SQLEXPRESS\MSSQL\DATA\Millonario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Millonario] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Millonario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Millonario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Millonario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Millonario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Millonario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Millonario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Millonario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Millonario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Millonario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Millonario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Millonario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Millonario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Millonario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Millonario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Millonario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Millonario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Millonario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Millonario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Millonario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Millonario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Millonario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Millonario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Millonario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Millonario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Millonario] SET  MULTI_USER 
GO
ALTER DATABASE [Millonario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Millonario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Millonario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Millonario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Millonario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Millonario] SET QUERY_STORE = OFF
GO
USE [Millonario]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 11/9/2022 17:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[PozoGanado] [int] NOT NULL,
	[ComodinDobleChance] [bit] NOT NULL,
	[Comodin50] [bit] NOT NULL,
	[ComodinSaltear] [bit] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 11/9/2022 17:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [varchar](200) NOT NULL,
	[NivelDificultad] [int] NOT NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 11/9/2022 17:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[OpcionRespuesta] [char](1) NOT NULL,
	[TextoRespuesta] [varchar](200) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (1, N'Thiago', CAST(N'2022-09-11T17:09:39.617' AS DateTime), -1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (1, N'¿Cuantos huesos tiene el cuerpo humano?', 1)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (2, N'¿En que continente queda Australia?', 1)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (3, N'¿Que artista compuso la cancion "Si no supiste amar"?', 1)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (4, N'¿Cual es el famoso personaje verde, grande y con mucha fuerza, del universo de Marvel?', 1)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (5, N'En la saga de Harry Potter ¿Que mago es el que mata a los papás del protagonista?', 2)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (6, N'¿Quien pinto el famoso cuadro cuyo nombre es "La noche estrellada"?', 2)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (7, N'¿Cuanto mide el Burj Khalifa?', 2)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (8, N'¿Cual es la provincia mas grande de Argentina en territorio?', 2)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (9, N'¿Cuando comenzo la revolucion rusa?', 3)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (10, N'¿Cual es la fecha patria mas importante de Estados Unidos?', 3)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (12, N'¿En que estado se encuentra la famosa atraccion "Monte Rushmore" en Estados Unidos?', 3)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (13, N'¿Como se llama el maximo goleador de la historia de Boca Juniors?', 3)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (14, N'¿Cual es el jugador que anoto más puntos en un partido de NBA?', 4)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (15, N'¿Cual de estos equipos no forma parte del famoso "Big six" del futbol ingles?', 4)
INSERT [dbo].[Pregunta] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (16, N'¿Que famoso fue encontrado muerto en florida?', 4)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (1, 1, N'A', N'209', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (2, 1, N'B', N'206', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (3, 1, N'C', N'207', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (4, 1, N'D', N'208', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (5, 2, N'A', N'Oceania', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (6, 2, N'B', N'África', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (7, 2, N'C', N'Europa', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (8, 2, N'D', N'Asia', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (9, 3, N'A', N'Sandro', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (10, 3, N'B', N'Ricardo Arjona', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (11, 3, N'C', N'Cristian Castro', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (12, 3, N'D', N'Luis Miguel', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (13, 4, N'A', N'Doctor Strange', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (14, 4, N'B', N'Hulk', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (15, 4, N'C', N'Black Widow', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (16, 4, N'D', N'Thanos', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (17, 5, N'A', N'Dumbledor', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (18, 5, N'B', N'Bellatrix Lestrange', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (19, 5, N'C', N'Sirius Black', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (20, 5, N'D', N'Lord Voldemort', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (21, 6, N'A', N'Ruben Da Vinci', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (22, 6, N'B', N'Eduardo Picasso', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (23, 6, N'C', N'Vicent Van Gogh', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (24, 6, N'D', N'Salvador Dali', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (25, 7, N'A', N'828 metros', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (26, 7, N'B', N'800 metros', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (27, 7, N'C', N'758 metros', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (28, 7, N'D', N'813 metros', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (29, 8, N'A', N'Rio Negro', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (30, 8, N'B', N'Ushuaia', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (31, 8, N'C', N'Chubut', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (32, 8, N'D', N'Buenos Aires', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (33, 9, N'A', N'1912', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (34, 9, N'B', N'1917', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (35, 9, N'C', N'1915', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (36, 9, N'D', N'1916', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (37, 10, N'A', N'8 de septiembre', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (38, 10, N'B', N'6 de diciembre', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (39, 10, N'C', N'17 de julio', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (40, 10, N'D', N'4 de julio', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (41, 12, N'A', N'Washington D.C.', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (42, 12, N'B', N'Dakota del sur', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (43, 12, N'C', N'Orlando', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (44, 12, N'D', N'Los Angeles', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (45, 13, N'A', N'Roberto Cherro', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (46, 13, N'B', N'Martin Palermo', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (47, 13, N'C', N'Juan Roman Riquelme', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (48, 13, N'D', N' Carlos Tévez', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (49, 14, N'A', N'Michael Jordan', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (50, 14, N'B', N'Manu Ginobili', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (51, 14, N'C', N'Kobe Bryant', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (53, 14, N'D', N'Wilt Chamberlain', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (54, 15, N'A', N'Leicester', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (55, 15, N'B', N'Tottenham', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (56, 15, N'C', N'Arsenal', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (58, 15, N'D', N'Manchester City', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (59, 16, N'A', N'Larry Wheels', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (60, 16, N'B', N'Bob Saget', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (61, 16, N'C', N'John Lennon', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (63, 16, N'D', N'Andrew Johnson', 0)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Pregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta]
GO
USE [master]
GO
ALTER DATABASE [Millonario] SET  READ_WRITE 
GO
