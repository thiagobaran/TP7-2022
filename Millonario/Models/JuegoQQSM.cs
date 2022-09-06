using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using Dapper;

namespace Millonario.Models
{
    public static class JuegoQQSM
    {
        private static string _connectionString = @"Server=a-phz2-cidi-019; Database=Millonario;Trusted_Connection=True;";
        private static int _idPreguntaActual;
        private static char _RespuestaCorrectaActual;
        private static int _PosicionPozo;
        private static int _PozoAcumuladoSeguro;
        private static int _PozoAcumulado;
        private static bool _Comodin50;
        private static bool _ComodinSaltear;
        private static bool _ComodinDobleChance;
        private static List<Pozo> _listaPozo = new List<Pozo>();
        private static Jugador _Player;

        public static void inicializarJuego(string nombre)
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
                _listaPozo = new List<Pozo>() {new Pozo(2000, false), new Pozo(5000, false), new Pozo(10000, false), new Pozo(20000, false), new Pozo(30000, true), new Pozo(50000, false), new Pozo(70000, false), new Pozo(100000, false), new Pozo(130000, false), new Pozo(180000, true), new Pozo(300000, false), new Pozo(500000, false), new Pozo(750000, false), new Pozo(1000000, false), new Pozo(2000000, true)};

                string sql = "INSERT INTO Jugador(Nombre, FechaHora,PozoGanado,ComodinDobleChance,Comodin50,ComodinSaltear) VALUES (@pNombre,@pFechaHora, @pPozoGanado, @pComodinDobleChance, @pComodin50, @pComodinSaltear)";
                    
                    using (SqlConnection db = new SqlConnection(_connectionString))
                {
                    db.Execute(sql, new {pNombre = _Player.Nombre, pFechaHora=_Player.FechaHora, pPozoGanado=_Player.PozoGanado, pComodinDobleChance=_Player.ComodinDobleChance, pComodin50=_Player.Comodin50, pComodinSaltear=_Player.ComodinSaltear});
                }
                _Player = DevolverJugador();
            }
        public static Pregunta obtenerProximaPregunta()
        {
                _idPreguntaActual++;
                using(SqlConnection db = new SqlConnection(_connectionString))
                {
                string sql = "SELECT * FROM Pregunta WHERE idPregunta = @pidPreguntaActual";
                return db.QueryFirstOrDefault<Pregunta>(sql, new {pidPreguntaActual=_idPreguntaActual});
                }
        }
        public static List<Respuesta> ObtenerRespuesta()
        {
            List<Respuesta> _ListaRespuesta = new List<Respuesta>();
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Respuesta WHERE idPregunta=@pidPreguntaActual";
                List<Respuesta> rsp = db.Query<Respuesta>(sql, new { pidPreguntaActual=_idPreguntaActual }).ToList();
                for (int x= 0; x<rsp.Count; x++)
                {
                    if (rsp[x].Correcta == true)
                    {
                        _RespuestaCorrectaActual = rsp[x].opcionRespuesta;
                    }
                }
                return rsp;
            }
        }
        public static bool RespuestaUsuario(char Opc1, char Opc2=' ')
        {
            bool RespuestaCorrecta = false;
            if (Opc1!=_RespuestaCorrectaActual && Opc2!=_RespuestaCorrectaActual) return RespuestaCorrecta=false;
            RespuestaCorrecta = true;
            if (Opc2 != ' ')
            {
                using (SqlConnection db = new SqlConnection(_connectionString))
                {
                    string sql = "UPDATE Jugador SET ComodinDobleChance = True WHERE idJugador = @player.idJugador";
                    db.Execute(sql, new {});
                }
            }
            if (Opc1 == _RespuestaCorrectaActual || Opc2 == _RespuestaCorrectaActual)
            {
                _idPreguntaActual++;
                if (_listaPozo[_PosicionPozo].valorSeguro == true)
                {
                    _PozoAcumulado = _listaPozo[_PosicionPozo].idImporte;
                }
                _PosicionPozo++; 
                
            }
           return RespuestaCorrecta;
        }
        public static List<Pozo> ListarPozo()
        {
            return _listaPozo;
        }
        public static int DevolverPosicionPozo()
        {
            return _PosicionPozo;
        }
        public static Jugador DevolverJugador()
        {
            
            string sql = "SELECT TOP 1 * FROM Jugador ORDER BY idJugador DESC";
                    
                    using (SqlConnection db = new SqlConnection(_connectionString))
                {
                    _Player= db.QueryFirstOrDefault(sql);
                }
            return _Player;
        }
    }
}