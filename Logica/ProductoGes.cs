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
  public  class ProductoGes: IProducto
    {
        public void GuardarProducto(ProductoEe obj)
        {
            try
            {
                new Productodao().GuardarProducto(obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<ProductoEe> ListarProducto(string cadena = "", ProductoEe.Busqueda Busqueda = ProductoEe.Busqueda.Todo)
        {
            List<ProductoEe> arr = new List<ProductoEe>();
            try
            {
                arr = new Productodao().ListarProducto(cadena, Busqueda);
                if(arr!=null && arr.Count > 0)
                {
                    List<UnidadMedidaEe> U = new Productodao().ListarUnidadmedida();
                    List<MarcaEe> M = new Productodao().ListarMarca();
                    arr.ForEach(r=> {
                        r.UnidadMedida = U.Find(x => x.Id == r.IdUnidadMedida);
                        r.Marca = M.Find(x => x.Id == r.IdMarca);
                    
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
