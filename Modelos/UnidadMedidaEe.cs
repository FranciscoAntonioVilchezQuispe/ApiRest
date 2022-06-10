using System;
using System.Collections.Generic;
using System.Text;

namespace Modelos
{
   public class UnidadMedidaEe
    {
		public int Id { get; set; }
		public string Codigo { get; set; }
		public string Descripcion { get; set; }
		public DateTime? FecCreacion { get; set; }
		public bool? Activo { get; set; }
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
            Descripcion = 2,
        }
    }
}
