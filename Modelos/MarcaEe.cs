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

    public enum BusquedaMarca
    {
        Todo = 0,
        PorId = 1,
        PorNombre = 2,
    }
}
