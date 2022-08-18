using System;

namespace Millonario.Models
{
    public class Respuesta
    {
        private int _idRespuesta;
        private int _idPregunta;
        private char _opcionRespuesta;
        private string _TextoRespuesta;
        private bool _Correcta;
        
        public Respuesta(int idRespuesta,int idPregunta,char opcionRespuesta,string TextoRespuesta,bool Correcta)
        {
            _idRespuesta = idRespuesta;
            _idPregunta = idPregunta;
            _opcionRespuesta = opcionRespuesta;
            _TextoRespuesta = TextoRespuesta;
            _Correcta = Correcta;
        }
        public Respuesta()
        {
            
        }
        
        public int idRespuesta
        {
            get{return _idRespuesta;}
            set { _idRespuesta = value; }
        } 
        public int idPregunta
        {
            get{return _idPregunta;}
            set { _idPregunta = value; }
        } 
        public char opcionRespuesta
        {
            get{return _opcionRespuesta;}
            set { _opcionRespuesta = value; }

        } 
        public string TextoRespuesta
        {
            get{return _TextoRespuesta;}
            set { _TextoRespuesta = value;}
        }
        public bool Correcta
        {
            get{return _Correcta;}
            set { _Correcta = value;}
        } 
    }
}