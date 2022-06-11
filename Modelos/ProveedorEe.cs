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
		public Utilitarios.UtilitariosEe.Status Accion { get; set; }
		public enum BusquedaProveedor
        {
            Todo = 0,
            PorId = 1,
            PorDocumento = 2,
        }
    }
}
