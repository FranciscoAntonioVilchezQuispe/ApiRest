using System;
using System.Collections.Generic;
using System.Text;

namespace Modelos
{
    public class ProductoEe
    {
        public long Id { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public string NombreComercial { get; set; }
        public int IdMarca { get; set; }
        public decimal PrecioVenta { get; set; }
        public decimal PrecioCompra { get; set; }
        public decimal Stock { get; set; }
        public int IdUnidadMedida { get; set; }
        public DateTime FecCreacion { get; set; }
        public bool Activo { get; set; }
        public MarcaEe Marca { get; set; }
        public UnidadMedidaEe UnidadMedida { get; set; }
        public Utilitarios.UtilitariosEe.Status Accion { get; set; }
        public enum BusquedaProducto
        {
            Todo = 0,
            PorId = 1,
            PorCodigo = 2,
        }
    }

}
