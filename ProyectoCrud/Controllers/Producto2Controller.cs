using ILogica;
using Microsoft.AspNetCore.Mvc;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoCrud.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Producto2Controller : ControllerBase
    {
        public IProducto Servicio;
        public Producto2Controller(IProducto _Servicio)
        {
            Servicio = _Servicio;
        }
        [HttpGet("ListarProducto")]
        public List<ProductoEe> GetListarProducto(string cadena = "", ProductoEe.Busqueda Busqueda = ProductoEe.Busqueda.Todo)
        {
            List<ProductoEe> Lista = new List<ProductoEe>();
            try
            {
                Lista = Servicio.ListarProducto(cadena, Busqueda);

            }
            catch (Exception ex)
            {

            }
            return Lista;
        }
        [HttpPost("GrabarProducto")]
        public string PostGrabarProducto(ProductoEe obj)
        {
            string respuesta = "";
            try
            {
                Servicio.GuardarProducto(obj);
                respuesta = "OK";
            }
            catch (Exception ex)
            {

                respuesta = ex.Message;
            }
            return respuesta;
        }
    }
}
