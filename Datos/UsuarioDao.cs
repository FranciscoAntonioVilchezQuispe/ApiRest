using System;
using Dapper;
using Modelos;
using Conexion;
using System.Collections.Generic;

namespace Datos
{
    public class UsuarioDao
    {
        public void GuardarUsuario(UsuarioEe obj)
        {
            try
            {
                if (obj.Accion != UsuarioEe.Status.Ninguno)
                {
                    string cadena = "";
                    switch (obj.Accion)
                    {
                        case UsuarioEe.Status.Insert:
                            cadena = @"INSERT INTO Usuarios
                                (CodTrabajador,Nombres,Apellidos,Clave,FecIngreso,Aleas,Activo)
                                     VALUES
                                (@CodTrabajador,@Nombres,@Apellidos,@Clave,getdate(),@Aleas,1)";
                            break;
                        case UsuarioEe.Status.Update:
                            cadena = @"UPDATE Usuarios
                                  SET CodTrabajador = @CodTrabajador
                                     ,Nombres = @Nombres
                                     ,Apellidos = @Apellidos
                                     ,Clave = @Clave
                                     ,Aleas = @Aleas
                                     ,Activo = @Activo
                                WHERE IdUsuario=@IdUsuario";
                            break;
                        case UsuarioEe.Status.Delete:
                            cadena = @"Delete from Usuarios where IdUsuario=@idUsuario";
                            break;
                    }
                    DynamicParameters P = new DynamicParameters(new
                    {
                        CodTrabajador = obj.CodTrabajador,
                        Nombres = obj.Nombres,
                        Apellidos = obj.Apellidos,
                        Clave = obj.ClaveEncriptada,
                        Aleas = obj.Aleas,
                        Activo = obj.Activo,
                        IdUsuario = obj.IdUsuario
                    });
                    DAPPER.Execute(cadena, P);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<UsuarioEe> ListarUsuarios(string cadena = "", UsuarioEe.Busqueda Busqueda = UsuarioEe.Busqueda.Todo)
        {
            List<UsuarioEe> arr = new List<UsuarioEe>();
            try
            {
                string query = "Select * from Usuarios ";
                if (!string.IsNullOrEmpty(cadena))
                {
                    switch (Busqueda)
                    {
                        case UsuarioEe.Busqueda.PorIdUsuario:
                            query += $" where Idusuario in ({cadena})";
                            break;
                        case UsuarioEe.Busqueda.PorCodigoTrabajador:
                            query += $" where CodTrabajador like'%{cadena}%'";
                            break;
                        case UsuarioEe.Busqueda.PornombreApellido:
                            query += $" where concat(Apellidos,' ',Nombres) like '%{cadena}%' or concat(Nombres,' ',Apellidos) like '%{cadena}%'";
                            break;
                    }
                }
                arr = DAPPER.Lista<UsuarioEe>(query);
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
    }
}
