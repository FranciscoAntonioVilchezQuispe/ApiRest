using Conexion;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
   public   class ProveedorDao
    {
        public List<ProveedorEe>ListarProveedor(string cadena,ProveedorEe.BusquedaProveedor busqueda = ProveedorEe.BusquedaProveedor.Todo)
        {
            List<ProveedorEe> arr = new List<ProveedorEe>();
            try
            {
                string query = "Select * from Proveedor";
                if (string.IsNullOrWhiteSpace(cadena))
                {
                    switch (busqueda)
                    {
                        case ProveedorEe.BusquedaProveedor.PorId:
                            query += $" where Id in ({cadena})";
                            break;
                        case ProveedorEe.BusquedaProveedor.PorDocumento:
                            query += $" where Documento like'%{cadena}%' ";
                            break;
                    }
                }


                arr = DAPPER.Lista<ProveedorEe>(query);
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }

    }
}
