using Modelos;
using System;
using System.Collections.Generic;

namespace ILogica
{
    public interface IUsuario
    {
        void GuardarUsuario(UsuarioEe obj);
        List<UsuarioEe> ListarUsuarios(string cadena = "", UsuarioEe.BusquedaUsuario Busqueda = UsuarioEe.BusquedaUsuario.Todo);
    }
}
