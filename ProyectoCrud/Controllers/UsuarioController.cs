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
    public class UsuarioController : ControllerBase
    {
        private IUsuario Servicio;
        public UsuarioController(IUsuario _Servicio)
        {
            Servicio = _Servicio;
        }
        [HttpGet("ListarUsuario")]
        public List<UsuarioEe> GetListarUsuario(string cadena1 = "", UsuarioEe.BusquedaUsuario Busqueda1 = UsuarioEe.BusquedaUsuario.Todo)
        {
            List<UsuarioEe> Lista = new List<UsuarioEe>();
            try
            {
                Lista = Servicio.ListarUsuarios(cadena1, Busqueda1);
                //Respuesta = LLenarRespuesta(true, "Ok", Lista);

            }
            catch (Exception ex)
            {

            }
            return Lista;
        }
        [HttpPost("GrabarUsuario")]
        public string PostGrabarusuario(UsuarioEe obj1)
        {
            string respuesta = "";
            try
            {
                Servicio.GuardarUsuario(obj1);
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
