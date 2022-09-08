using System;

namespace Millonario.Models
{
    public class Jugador
    {
        private int _IdJugador;
        private string _Nombre;
        private DateTime _FechaHora;
        private int _PozoGanado;
        private bool _ComodinDobleChance;
        private bool _Comodin50;
        private bool _ComodinSaltear;
        
        public Jugador(int IdJugador,string Nombre,DateTime FechaHora,int PozoGanado,bool ComodinDobleChance,bool Comodin50,bool ComodinSaltear)
        {
            _IdJugador = IdJugador;
            _Nombre = Nombre;
            _FechaHora = FechaHora;
            _PozoGanado = PozoGanado;
            _ComodinDobleChance = ComodinDobleChance;
            _Comodin50 = Comodin50;
            _ComodinSaltear = ComodinSaltear;
        }
        public Jugador()
        {
            
        }
        
        public int IdJugador
        {
            get{return _IdJugador;}
            set { _IdJugador = value; }
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
            get{return _PozoGanado;}
            set { _PozoGanado = value;}
        }
        public bool ComodinDobleChance
        {
            get{return _ComodinDobleChance;}
            set { _ComodinDobleChance = value;}
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