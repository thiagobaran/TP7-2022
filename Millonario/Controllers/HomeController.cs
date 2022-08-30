using System.Diagnostics;
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
[HttpGet]
    public IActionResult Pregunta(string Nombre)
    {
        
        return View();
    }
    public IActionResult PreguntaRespondida(char opcion1, char opcion2)
    {
        return View();
    }
    public IActionResult RespuestapreguntaOk()
    {
        return View();
    }
    public IActionResult PantallaFindelJuego()
<<<<<<< HEAD
=======
    {
        return View();
    }
[HttpGet]
    public IActionResult Pregunta(string Nombre)
    {
        return View();
    }
    public IActionResult PreguntaRespondida(char opcion1, char opcion2)
>>>>>>> 945f54b0ce647fceb3d159b1bbf8e371eba68ccb
    {
        return View();
    }
    public IActionResult FinDelJuego()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}