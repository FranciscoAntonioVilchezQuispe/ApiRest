using System;
using System.Collections.Generic;
using System.Text;

namespace Modelos
{
    public class CompraDetalleEe
    {
        public int Id { get; set; }
        public long IdCompra { get; set; }
        public long IdProducto { get; set; }
        public int IdUnidadMedida { get; set; }
        public decimal Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal Total { get; set; }
        public ProductoEe Producto { get; set; }
        public UnidadMedidaEe UnidadMedida { get; set; }
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
            PorIdCompra = 2,

        }
    }
}
