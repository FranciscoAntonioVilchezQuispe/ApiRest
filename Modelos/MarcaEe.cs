using System;
using System.Collections.Generic;
using System.Text;

namespace Modelos
{
   public class MarcaEe
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime FecCreacion { get; set; }
        public bool Activo { get; set; }
    }
    public enum Status
    {
        Ninguno = 0,
        Insert = 1,
        Update = 2,
        Delete = 3,
    }
    public enum Busqueda
    {
        Todo = 0,
        PorId = 1,
        PorNombre = 2,
    }
}
