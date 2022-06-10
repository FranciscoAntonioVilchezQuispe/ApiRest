using Conexion;
using Dapper;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Productodao
    {
        public void GuardarProducto(ProductoEe obj)
        {
            try
            {
                if (obj.Accion != ProductoEe.Status.Ninguno)
                {
                    string cadena = "";
                    switch (obj.Accion)
                    {
                        case ProductoEe.Status.Insert:
                            cadena = @"INSERT INTO Producto
                                       (Codigo,Descripcion,NombreComercial,IdMarca
                                       ,PrecioVenta,PrecioCompra,Stock,IdUnidadMedida,FecCreacion,Activo)
                                            VALUES
                                       (@Codigo,@Descripcion,@NombreComercial,@IdMarca
                                       ,@PrecioVenta,@PrecioCompra,@Stock,@IdUnidadMedida,getdate(),1)";
                            break;
                        case ProductoEe.Status.Update:
                            cadena = @"UPDATE Producto
                                          SET Codigo = @Codigo
                                             ,Descripcion = @Descripcion
                                             ,NombreComercial = @NombreComercial
                                             ,IdMarca = @IdMarca
                                             ,PrecioVenta = @PrecioVenta
                                             ,PrecioCompra = @PrecioCompra
                                             ,Stock = @Stock
                                             ,IdUnidadMedida = @IdUnidadMedida
                                        WHERE Id=@id";
                            break;
                        case ProductoEe.Status.Delete:
                            cadena = @"Delete from Producto where Id=@id";
                            break;
                    }
                    DynamicParameters P = new DynamicParameters(new
                    {
                        Codigo = obj.Codigo,
                        Descripcion = obj.Descripcion,
                        NombreComercial = obj.NombreComercial,
                        IdMarca = obj.IdMarca,
                        PrecioVenta = obj.PrecioVenta,
                        PrecioCompra = obj.PrecioCompra,
                        Stock = obj.Stock,
                        IdUnidadMedida = obj.IdUnidadMedida,
                        Id = obj.Id
                    });
                    DAPPER.Execute(cadena, P);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<ProductoEe> ListarProducto(string cadena, ProductoEe.Busqueda busqueda = ProductoEe.Busqueda.Todo)
        {
            List<ProductoEe> arr = new List<ProductoEe>();
            try
            {
                string query = "Select * from producto ";
                if (!string.IsNullOrEmpty(cadena))
                {
                    switch (busqueda)
                    {
                        case ProductoEe.Busqueda.PorId:
                            query += $" where Id in ({cadena})";
                            break;
                        case ProductoEe.Busqueda.PorCodigo:
                            query += $" where Codigo like'%{cadena}%'";
                            break;

                    }
                }
                arr = DAPPER.Lista<ProductoEe>(query);
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
        public List<UnidadMedidaEe> ListarUnidadmedida()
        {
            List<UnidadMedidaEe> arr = new List<UnidadMedidaEe>();
            try
            {
                arr = DAPPER.Lista<UnidadMedidaEe>("select * from UnidadMedida");
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
        public List<MarcaEe> ListarMarca()
        {
            List<MarcaEe> arr = new List<MarcaEe>();
            try
            {
                arr = DAPPER.Lista<MarcaEe>("select * from Marcas");
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
    }
}
