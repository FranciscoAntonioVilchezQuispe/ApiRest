using System;
using System.Collections.Generic;
using System.Text;

namespace Modelos
{
    public class CompraEe
    {
        public long Id { get; set; }
        /// <summary>
        /// Bo:Boleta
        /// Fa:Factura
        /// </summary>
        public string TipoComprobante { get; set; }
        public int IdProveedor { get; set; }
        public int IdUsuario { get; set; }
        public string Proveedordescripcion { get; set; }
        public string Serie { get; set; }
        public long Numero { get; set; }
        /// <summary>
        /// E:Efectivo
        /// T:tarjeta
        /// </summary>
        public string MedioPago { get; set; }
        /// <summary>
        /// CT:Contado
        /// CR:Credito
        /// </summary>
        public string CondicionPago { get; set; }
        public DateTime FecEmision { get; set; }
        public DateTime FecVencimiento { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Igv { get; set; }
        public decimal Total { get; set; }
        public DateTime FecCreacion { get; set; }
        public bool Activo { get; set; }
        public List<CompraDetalleEe> Detalle { get; set; }
        public ProveedorEe Proveedor { get; set; }
        public UsuarioEe Usuario { get; set; }
        public Status Accion { get; set; }
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
            PorIdCompra = 1,
            PorIdUsuario = 2,
            PorIdProveedor = 3,
        }
    }
}
