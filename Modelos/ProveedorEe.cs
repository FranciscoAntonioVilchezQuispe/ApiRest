using System;
using System.Collections.Generic;
using System.Text;

namespace Modelos
{
   public class ProveedorEe
    {
		public int Id { get; set; }
		public string Documento { get; set; }
		public string RazonSocial { get; set; }
		public string Apellido { get; set; }
		public string Nombre { get; set; }
		public string Telefono { get; set; }
		public string Direccion { get; set; }
		public DateTime FecIngreso { get; set; }
		public bool Activo { get; set; }
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
            PorDocumento = 2,
        }
    }
}
