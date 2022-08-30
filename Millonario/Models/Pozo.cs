using System;

namespace Millonario.Models
{
    public class Pozo
    {
        private int _idImporte;
        private bool _valorSeguro;
        
        public Pozo(int idImporte,bool valorSeguro)
        {
            _idImporte = idImporte;
            _valorSeguro = valorSeguro;
        }
        
        public int idImporte
        {
            get{return _idImporte;}
            set { _idImporte = value; }
        } 
        public bool valorSeguro
        {
            get{return _valorSeguro;}
            set { _valorSeguro = value; }
        } 
    }
}