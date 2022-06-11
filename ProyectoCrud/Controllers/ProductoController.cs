using ILogica;
using Microsoft.AspNetCore.Http;
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
    public class ProductoController : ControllerBase
    {
        private IProducto Servicio;
        public ProductoController(IProducto _Servicio)
        {
            Servicio = _Servicio;
        }
        [HttpGet("ListarPRODUCTO")]
        public List<ProductoEe> GetListarPRODUCTO(string cadena = "", ProductoEe.BusquedaProducto Busqueda = ProductoEe.BusquedaProducto.Todo)
        {
            List<ProductoEe> Lista = new List<ProductoEe>();
            try
            {
                Lista = Servicio.ListarProducto(cadena, Busqueda);
                //Respuesta = LLenarRespuesta(true, "Ok", Lista);

            }
            catch (Exception ex)
            {

            }
            return Lista;
        }
        [HttpPost("GrabarPRODUCTO")]
        public string PostGrabarPRODUCTO(ProductoEe obj)
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
