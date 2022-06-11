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
   public class CompraGes:ICompra
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
        public List<CompraEe> ListarCompra(string cadena = "", CompraEe.Busqueda Busqueda = CompraEe.Busqueda.Todo)
        {
            List<CompraEe> arr = new List<CompraEe>();
            try
            {
                arr = new CompraDao().Listarcompra(cadena, Busqueda);
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
    }
}
