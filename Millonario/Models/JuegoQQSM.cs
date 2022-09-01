using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using Dapper;

namespace Millonario.Models
{
    public static class JuegoQQSM
    {
        private static string _connectionString = @"Server=A-PHZ2-CIDI-047\SQLExpress; Database=Millonario;Trusted_Connection=True;";
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
                _idPreguntaActual = 0;
                _RespuestaCorrectaActual = ' ';
                _PosicionPozo = 0;
                _PozoAcumuladoSeguro = 0;
                _PozoAcumulado = 0;
                _Comodin50 = false;
                _ComodinSaltear = false;
                _ComodinDobleChance = false;
                _Player = new Jugador(-1,"",DateTime.Now,-1,false,false,false);

                using(SqlConnection db = new SqlConnection(_connectionString))
                {
                    string sql = "INSERT INTO Jugadores(IdJugador, Nombre, FechaHora) VALUES (@pIdJugador,@pNombre,@pFechaHora)";
                    db.Execute(sql,new {pIdJugador = jugador.idJugador, pNombre = jugador.Nombre, pFechaHora = jugador.FechaHora});
                }
            }
        public static Pregunta obtenerProximaPregunta()
        {
            for(int x=1;x<15;x++)
            {
                _idPreguntaActual = x;
                using(SqlConnection db = new SqlConnection(_connectionString))
                {
                string sql = "SELECT Preguntas.textoPregunta, Preguntas.nivelDificultad FROM Preguntas WHERE(_idPregunta =idPreguntaActual)";
                return db.QueryFirstOrDefault<Pregunta>(sql,new{idPregunta = _idPreguntaActual});
                }
            }
            return null;
        }
        public static List<Respuesta> ObtenerRespuesta()
        {
            List<Respuesta> _ListaRespuesta = new List<Respuesta>();
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Respuestas WHERE(_idPregunta =idPreguntaActual)";
                _ListaRespuesta = db.QueryFirstOrDefault<Respuesta>(sql,new{idPregunta = _idPreguntaActual});

                string Respuesta = "SELECT * FROM Respuestas WHERE(Correcta = 1 && _idPregunta =idPreguntaActual)";
                _RespuestaCorrectaActual =  db.QueryFirstOrDefault<Respuesta>(sql,new{idRespuesta = _idRespuestaActual});
            }
            return List<Respuesta>;
        }
        public static Respuesta RespuestaUsuario(char Opción, char OpcionComodin=' ')
        {
            
            if(OpcionComodin!=null)
            {
                Jugador.ComodinDobleChance=0;
            }
            return;
        }
    }
}