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
    public class CompraDao
    {
        public void GrabarCompra(CompraEe obj)
        {
            try
            {
                StringBuilder cadena = new StringBuilder();
                if (obj.Accion != Utilitarios.UtilitariosEe.Status.Ninguno)
                {
                    switch (obj.Accion)
                    {
                        case Utilitarios.UtilitariosEe.Status.Insert:
                            cadena.AppendLine($@"INSERT INTO Compra
                                (TipoComprobante,IdProveedor,Proveedordescripcion,Serie,Numero,MedioPago,CondicionPago,FecEmision,
                                    FecVencimiento,SubTotal,Igv,Total,FecCreacion,IdUsuario,Activo)
                                     VALUES
                                (@TipoComprobante,@IdProveedor,@Proveedordescripcion,@Serie,@Numero,@MedioPago,@CondicionPago,@FecEmision,
                                    @FecVencimiento,@SubTotal,@Igv,@Total,@FecCreacion,@IdUsuario,@Activo); 
                                    declare @IdCompra int=SCOPE_IDENTITY()");
                            obj.Detalle.ForEach(r =>
                            {
                                cadena.AppendLine($@"INSERT INTO CompraDetalle
			                    (IdCompra,IdProducto,IdUnidadMedida,Cantidad,PrecioUnitario,Total)
			                         VALUES
			                    (@IdCompra,{r.IdProducto},{r.IdUnidadMedida},{r.Cantidad},{r.Cantidad},{r.Total})");
                            });
                            break;
                        case Utilitarios.UtilitariosEe.Status.Update:
                            cadena.Append($@"UPDATE Compra
                                               SET TipoComprobante = @TipoComprobante
                                                  ,IdProveedor = @IdProveedor
                                                  ,Proveedordescripcion = @Proveedordescripcion
                                                  ,Serie = @Serie
                                                  ,Numero = @Numero
                                                  ,MedioPago = @MedioPago
                                                  ,CondicionPago = @CondicionPago
                                                  ,FecEmision = @FecEmision
                                                  ,FecVencimiento = @FecVencimiento
                                                  ,SubTotal = @SubTotal
                                                  ,Igv = @Igv
                                                  ,Total = @Total
                                                  ,FecCreacion = @FecCreacion
                                                  ,IdUsuario = @IdUsuario
                                                  ,Activo = @Activo
                                             WHERE Id=@Id ;
                                            delete compradetalle where idcompra=@Id;");
                            obj.Detalle.ForEach(r =>
                            {
                                cadena.AppendLine($@"INSERT INTO CompraDetalle
			                    (IdCompra,IdProducto,IdUnidadMedida,Cantidad,PrecioUnitario,Total)
			                         VALUES
			                    (@IdCompra,{r.IdProducto},{r.IdUnidadMedida},{r.Cantidad},{r.Cantidad},{r.Total})");
                            });
                            break;
                        case Utilitarios.UtilitariosEe.Status.Delete:
                            cadena.AppendLine("delete from compradetalle where idcompra=@id;" +
                                                "delete from compra where id=@id");
                            break;
                    }
                    DynamicParameters P = new DynamicParameters(new
                    {
                        TipoComprobante = obj.TipoComprobante,
                        IdProveedor = obj.IdProveedor,
                        Proveedordescripcion = obj.Proveedordescripcion,
                        Serie = obj.Serie,
                        Numero = obj.Numero,
                        MedioPago = obj.MedioPago,
                        CondicionPago = obj.CondicionPago,
                        FecEmision = obj.FecEmision,
                        FecVencimiento = obj.FecVencimiento,
                        SubTotal = obj.SubTotal,
                        Igv = obj.Igv,
                        Total = obj.Total,
                        FecCreacion = obj.FecCreacion,
                        IdUsuario = obj.IdUsuario,
                        Activo = obj.Activo,
                        Id = obj.Id

                    });
                    DAPPER.Execute(cadena.ToString(), P);
                }


            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<CompraEe> Listarcompra(string cadena = "", CompraEe.BusquedaCompra busqueda = CompraEe.BusquedaCompra.Todo)
        {
            List<CompraEe> arr = new List<CompraEe>();
            try
            {
                string query = "select * from compra";
                if (!string.IsNullOrWhiteSpace(cadena))
                {
                    switch (busqueda)
                    {
                        case CompraEe.BusquedaCompra.PorIdCompra:
                            query += $" where Id in ({cadena})";
                            break;
                        case CompraEe.BusquedaCompra.PorIdProveedor:
                            query += $" where IdProveedor in({cadena})";
                            break;
                        case CompraEe.BusquedaCompra.PorIdUsuario:
                            query = $"Exec ListarComprasPorUsuario {cadena}";
                            break;

                    }

                }
                arr = DAPPER.Lista<CompraEe>(query, null, busqueda == CompraEe.BusquedaCompra.PorIdUsuario ? System.Data.CommandType.StoredProcedure : System.Data.CommandType.Text);
                if (arr != null && arr.Count > 0)
                {
                    List<CompraDetalleEe> d = ListarDetalle(string.Join(",", arr.Select(r => r.Id)), CompraDetalleEe.BusquedaCompraDetalle.PorIdCompra);
                    List<UsuarioEe> U = new UsuarioDao().ListarUsuarios(string.Join(",", arr.Select(r => r.IdUsuario)), UsuarioEe.BusquedaUsuario.PorIdUsuario);
                    arr.ForEach(r =>
                    {
                        r.Usuario = U.Find(x => x.IdUsuario == r.IdUsuario);
                        r.Detalle = d.FindAll(x => x.IdCompra == r.Id);
                    });
                }
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
        public List<CompraDetalleEe> ListarDetalle(string cadena = "", CompraDetalleEe.BusquedaCompraDetalle busqueda = CompraDetalleEe.BusquedaCompraDetalle.Todo)
        {
            List<CompraDetalleEe> arr = new List<CompraDetalleEe>();
            try
            {
                string query = "select * from CompraDetalle";
                if (!string.IsNullOrWhiteSpace(cadena))
                {
                    switch (busqueda)
                    {
                        case CompraDetalleEe.BusquedaCompraDetalle.PorId:
                            query += $" where Id in ({cadena})";
                            break;
                        case CompraDetalleEe.BusquedaCompraDetalle.PorIdCompra:
                            query += $" where IdCompra in({cadena})";
                            break;


                    }

                }
                arr = DAPPER.Lista<CompraDetalleEe>(query);
                if (arr != null && arr.Count > 0)
                {
                    List<ProductoEe> P = new Productodao().ListarProducto(string.Join(",", arr.Select(r => r.IdProducto)), ProductoEe.BusquedaProducto.PorId);
                    List<UnidadMedidaEe> U = new Productodao().ListarUnidadmedida();
                    arr.ForEach(r =>
                    {
                        r.Producto = P.Find(x => x.Id == r.IdProducto);
                        r.UnidadMedida = U.Find(x => x.Id == r.IdUnidadMedida);
                    });
                }
            }
            catch (Exception)
            {

                throw;
            }
            return arr;
        }
    }
}
