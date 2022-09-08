using System;

namespace Millonario.Models
{
    public class Pregunta
    {
        private int _idPregunta;
        private string _TextoPregunta;
        private int _NivelDificultad;
        
        public Pregunta(int idPregunta,string textoPregunta,int nivelDificultad)
        {
            _idPregunta = idPregunta;
            _TextoPregunta = TextoPregunta;
            _NivelDificultad = NivelDificultad;
        }
        public Pregunta()
        {
            
        }
        
        public int idPregunta
        {
            get{return _idPregunta;}
            set { _idPregunta = value; }
        } 
        public string TextoPregunta
        {
            get{return _TextoPregunta;}
            set { _TextoPregunta = value; }

        } 
        public  int NivelDificultad
        {
            get{return _NivelDificultad;}
            set { _NivelDificultad = value; }
        } 
    }
}