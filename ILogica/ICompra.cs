using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILogica
{
   public interface ICompra
    {
        void GuardarCompra(CompraEe obj);
        List<CompraEe> ListarCompra(string cadena = "", CompraEe.BusquedaCompra Busqueda = CompraEe.BusquedaCompra.Todo);
    }
}
