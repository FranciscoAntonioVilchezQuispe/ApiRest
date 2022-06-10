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
        public List<UsuarioEe>GetListarUsuario(string cadena = "", UsuarioEe.Busqueda Busqueda = UsuarioEe.Busqueda.Todo)
        {
            List<UsuarioEe> Lista = new List<UsuarioEe>();
            try
            {
              Lista = Servicio.ListarUsuarios(cadena,Busqueda);
                //Respuesta = LLenarRespuesta(true, "Ok", Lista);

            }
            catch (Exception ex)
            {

            }
            return Lista;
        }
    }
}
