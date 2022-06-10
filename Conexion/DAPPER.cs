using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Conexion
{
   public static class DAPPER
    {
        static string cadenaConexion = Base.ConnectionString;

        public static int Execute(String sql, DynamicParameters parametros = null, CommandType Tipo = CommandType.Text)
        {
            SqlConnection connection = null;
            SqlTransaction transaction = null;
            int escalar = 0;
            try
            {
                if (!sql.Contains("exec"))
                    if (sql.Contains("Insert ") || sql.Contains("INSERT"))
                    {

                        sql += $"; select Scope_identity();";

                    }
                    else
                    {
                        sql += $"; select @@ROWCOUNT;";
                    }
                connection = new SqlConnection(cadenaConexion);
                connection.Open();
                transaction = connection.BeginTransaction();
                escalar = connection.ExecuteScalar<int>(sql, parametros, transaction, null, Tipo);
                transaction.Commit();
            }
            catch (Exception)
            {
                if (transaction != null)
                    transaction.Rollback();
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
                throw;
            }
            finally
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
                connection.Dispose();
            }
            return escalar;
        }
        public static T Objeto<T>(String Cadena, DynamicParameters parametros = null, CommandType Tipo = CommandType.Text)
        {
            SqlConnection connection = null;
            try
            {
                connection = new SqlConnection(cadenaConexion);
                connection.Open();
                return connection.Query<T>(Cadena, parametros, null, true, null, Tipo).FirstOrDefault();
            }
            catch (Exception)
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
                throw;
            }
            finally
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
            }
        }
        public static List<T> Lista<T>(String Cadena, DynamicParameters parametros = null, CommandType Tipo = CommandType.Text)
        {
            SqlConnection connection = null;
            try
            {
                connection = new SqlConnection(cadenaConexion);
                connection.Open();
                return connection.Query<T>(Cadena, parametros, null, true, null, Tipo).ToList();

            }
            catch (Exception ex)
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
                throw;
            }
            finally
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
            }
        }
        public static DataTable Reader(String Cadena, DynamicParameters parametros = null, CommandType Tipo = CommandType.Text)
        {
            SqlConnection connection = null;
            DataTable Dt = new DataTable();
            try
            {
                connection = new SqlConnection(cadenaConexion);
                connection.Open();
                Dt.Load(connection.ExecuteReader(Cadena, parametros, null, null, Tipo));
                return Dt;

            }
            catch (Exception ex)
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
                throw;
            }
            finally
            {
                if (connection != null)
                    if (connection.State == ConnectionState.Open)
                        connection.Close();
            }
        }

    }
}
