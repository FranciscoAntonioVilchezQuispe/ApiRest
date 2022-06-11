using Datos;
using ILogica;
using Modelos;
using System;
using System.Collections.Generic;

namespace Logica
{
    public class UsuarioGes:IUsuario
    {
        public void GuardarUsuario(UsuarioEe obj)
        {
            try
            {
                new UsuarioDao().GuardarUsuario(obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<UsuarioEe> ListarUsuarios(string cadena = "", UsuarioEe.BusquedaUsuario Busqueda = UsuarioEe.BusquedaUsuario.Todo)
        {
            List<UsuarioEe> arr = new List<UsuarioEe>();
            try
            {
                arr = new UsuarioDao().ListarUsuarios(cadena, Busqueda);
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }

    }
}
