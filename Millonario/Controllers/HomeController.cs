﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Millonario.Models;

namespace Millonario.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Player()
    {
        return View();
    }
    [HttpPost]
    public IActionResult Pregunta(string Nombre)
    {
        JuegoQQSM.inicializarJuego(Nombre);
        ViewBag.PreguntaActual = JuegoQQSM.obtenerProximaPregunta();
        ViewBag.RespuestaActual = JuegoQQSM.ObtenerRespuesta();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozo = JuegoQQSM.ListarPozo();
        return View("Pregunta");
    }
    public IActionResult ProxPregunta()
    {
        ViewBag.PreguntaActual = JuegoQQSM.obtenerProximaPregunta();
        ViewBag.RespuestaActual = JuegoQQSM.ObtenerRespuesta();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozo = JuegoQQSM.ListarPozo();
        return View("Pregunta");
    }
    public IActionResult PreguntaRespondida(char Opc1, char Opc2)
    {
        if(JuegoQQSM.RespuestaUsuario(Opc1, Opc2) == true) return View("RespuestaPreguntaOK");
        else return View("PantallaFindelJuego");
    }
    public IActionResult FinDelJuego()
    {
        ViewBag.infoPlayer = JuegoQQSM.DevolverJugador();
        ViewBag.pozoGanado = JuegoQQSM.ListarPozo();
        return View("PantallaFindelJuego");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}