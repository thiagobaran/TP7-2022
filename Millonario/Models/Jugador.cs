using System;

namespace Millonario.Models
{
    public class Jugador
    {
        private int _idJugador;
        private string _Nombre;
        private DateTime _FechaHora;
        private int _pozoGanado;
        private bool _comodinDobleChance;
        private bool _Comodin50;
        private bool _ComodinSaltear;
        
        public Jugador(int idJugador,string Nombre,DateTime FechaHora,int PozoGanado,bool ComodinDobleChance,bool Comodin50,bool ComodinSaltear)
        {
            _idJugador = idJugador;
            _Nombre = Nombre;
            _FechaHora = FechaHora;
            _pozoGanado = PozoGanado;
            _comodinDobleChance = ComodinDobleChance;
            _Comodin50 = Comodin50;
            _ComodinSaltear = ComodinSaltear;
        }
        public Jugador()
        {
            
        }
        
        public int idJugador
        {
            get{return _idJugador;}
            set { _idJugador = value; }
        } 
        public string Nombre
        {
            get{return _Nombre;}
            set { _Nombre = value; }
        } 
        public DateTime FechaHora
        {
            get{return _FechaHora;}
            set { _FechaHora = value; }

        } 
        public int PozoGanado
        {
            get{return _pozoGanado;}
            set { _pozoGanado = value;}
        }
        public bool ComodinDobleChance
        {
            get{return _comodinDobleChance;}
            set { _comodinDobleChance = value;}
        }
        public bool Comodin50
        {
            get{return _Comodin50;}
            set { _Comodin50 = value;}
        } 
        public bool ComodinSaltear
        {
            get{return _ComodinSaltear;}
            set { _ComodinSaltear = value;}
        } 
    }
}