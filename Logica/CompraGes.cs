using Datos;
using ILogica;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class CompraGes : ICompra
    {
        public void GuardarCompra(CompraEe obj)
        {
            try
            {
                new CompraDao().GrabarCompra(obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<CompraEe> ListarCompra(string cadena = "", CompraEe.BusquedaCompra Busqueda = CompraEe.BusquedaCompra.Todo)
        {
            List<CompraEe> arr = new List<CompraEe>();
            try
            {
                arr = new CompraDao().Listarcompra(cadena, Busqueda);
                if (arr != null && arr.Count > 0)
                {
                    List<CompraDetalleEe> d = new CompraDao().ListarDetalle(string.Join(",", arr.Select(r => r.Id)), CompraDetalleEe.BusquedaCompraDetalle.PorIdCompra);
                    List<UsuarioEe> U = new UsuarioDao().ListarUsuarios(string.Join(",", arr.Select(r => r.IdUsuario)), UsuarioEe.BusquedaUsuario.PorIdUsuario);
                    List<ProveedorEe> P = new ProveedorDao().ListarProveedor(string.Join(",", arr.Select(r => r.IdProveedor)), ProveedorEe.BusquedaProveedor.PorId);
                    arr.ForEach(r =>
                    {
                        r.Usuario = U.Find(x => x.IdUsuario == r.IdUsuario);
                        r.Detalle = d.FindAll(x => x.IdCompra == r.Id);
                        r.Proveedor = P.Find(x => x.Id == r.IdProveedor);
                    });
                }
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
    }
}
