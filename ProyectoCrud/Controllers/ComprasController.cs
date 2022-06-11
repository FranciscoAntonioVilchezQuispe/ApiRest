using ILogica;
using Microsoft.AspNetCore.Mvc;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProyectoCrud.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComprasController : ControllerBase
    {
        private ICompra Servicio;
        public ComprasController(ICompra _Servicio)
        {
            Servicio = _Servicio;
        }
        [HttpGet("ListarCompra")]
        public List<CompraEe> GetListarCompra(string cadena1 = "", CompraEe.BusquedaCompra Busqueda1 = CompraEe.BusquedaCompra.Todo)
        {
            List<CompraEe> Lista = new List<CompraEe>();
            try
            {
                Lista = Servicio.ListarCompra(cadena1, Busqueda1);
                //Respuesta = LLenarRespuesta(true, "Ok", Lista);

            }
            catch (Exception ex)
            {

            }
            return Lista;
        }
        [HttpPost("GrabarCompra")]
        public string PostGrabarCompra(CompraEe obj1)
        {
            string respuesta = "";
            try
            {
                Servicio.GuardarCompra(obj1);
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
