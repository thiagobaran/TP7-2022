using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using Dapper;

namespace Millonario.Models
{
    public static class JuegoQQSM
    {
        private static string _connectionString = @"Server=Baranlenor7\SQLExpress; Database=Millonario;Trusted_Connection=True;";
        private static int _idPreguntaActual;
        private static char _RespuestaCorrectaActual;
        private static int _PosicionPozo;
        private static int _PozoAcumuladoSeguro;
        private static int _PozoAcumulado;
        private static bool _Comodin50;
        private static bool _ComodinSaltear;
        private static bool _ComodinDobleChance;
        private static List<Pozo> ListaPozo = new List<Pozo>(null);
        private static Jugador _Player;
        public static void inicializarJuego(string nombre, Jugador jugador)
            {
                _idPreguntaActual = idPreguntaActual;
                _RespuestaCorrectaActual = RespuestaCorrectaActual;
                _PosicionPozo = PosicionPozo;
                _PozoAcumuladoSeguro = PozoAcumuladoSeguro;
                _PozoAcumulado = PozoAcumulado;
                _Comodin50 = Comodin50;
                _ComodinSaltear = ComodinSaltear;
                _ComodinDobleChance = ComodinDobleChance;
                _Player = Player;

                using(SqlConnection db = new SqlConnection(_connectionString))
                {
                    string sql = "INSERT INTO Jugadores(IdJugador, Nombre, FechaHora) VALUES (@pIdJugador,@pNombre,@pFechaHora)";
                    db.Execute(sql,new {pIdJugador = jugador.idJugador, pNombre = jugador.Nombre, pFechaHora = jugador.FechaHora});
                }
            }
        public static Pregunta obtenerProximaPregunta()
        {
            Pregunta preg;
            for(int x=1;x<15;x++)
            {
                idPreguntaActual = x;
                using(SqlConnection db = new SqlConnection(_connectionString))
                {
                string PreguntaActual = "SELECT Preguntas.textoPregunta, Preguntas.nivelDificultad FROM Preguntas WHERE(_idPregunta =idPreguntaActual)";
                preg = db.QueryFirstOrDefault<Pregunta>(sql,new{idPreguntaActual = idPregunta});
                }
            }
            return preg;
        }
        public static List<Respuesta> ObtenerRespuesta()
        {
            List<Respuesta> _ListaRespuesta = new List<Respuesta>();
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                string RespuestaActual = "SELECT * FROM Respuestas WHERE(_idPregunta =idPreguntaActual)";
                _ListaRespuesta = db.QueryFirstOrDefault<Respuesta>(sql,new{idPreguntaActual = idPregunta});

                string Respuesta = "SELECT * FROM Respuestas WHERE(Correcta = 1 && _idPregunta =idPreguntaActual)";
                _RespuestaCorrectaActual =  db.QueryFirstOrDefault<Respuesta>(sql,new{idRespuestaActual = idRespuesta});
            }
            return List<Respuesta>;
        }
    }
}