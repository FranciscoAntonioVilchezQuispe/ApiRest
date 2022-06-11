using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILogica
{
   public interface IProducto
    {
        void GuardarProducto(ProductoEe obj);
        List<ProductoEe> ListarProducto(string cadena = "", ProductoEe.BusquedaProducto Busqueda = ProductoEe.BusquedaProducto.Todo);

    }
}
