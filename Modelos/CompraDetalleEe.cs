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
        public Utilitarios.UtilitariosEe.Status Accion { get; set; }
        public enum BusquedaCompraDetalle
        {
            Todo = 0,
            PorId = 1,
            PorIdCompra = 2,

        }
    }
}
