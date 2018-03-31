using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using kifome.Classes;

/// <summary>
/// Descrição resumida de MateriaPrimaBD
/// </summary>
/// 

namespace kifome.Persistencia
{
    public class MateriaPrimaBD
    {
        //métodos

        //insert
        public bool Insert(MateriaPrima materia)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO mat_materiaprima(mat_nome, mat_quantidade, mat_descricao, mat_status) VALUES (?nome, ?quantidade, ?descricao, ?status)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", materia.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidade", materia.Quantidade));
            objCommand.Parameters.Add(Mapped.Parameter("?descricao", materia.Descricao));
            objCommand.Parameters.Add(Mapped.Parameter("?status", materia.Status));
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }

        //Select All
        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM mat_materiaprima  ORDER BY mat_nome", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        //select
        public MateriaPrima Select(int id)
        {
            MateriaPrima obj = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM mat_materiaprima WHERE mat_codigo = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj = new MateriaPrima();
                obj.Codigo = Convert.ToInt32(objDataReader["mat_codigo"]);
                obj.Nome = Convert.ToString(objDataReader["mat_nome"]);
                obj.Quantidade = Convert.ToDouble(objDataReader["mat_quantidade"]);
                obj.Descricao = Convert.ToString(objDataReader["mat_descricao"]);                
                obj.Status = Convert.ToString(objDataReader["mat_status"]);
                
            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }
        //update
        public bool Update(MateriaPrima materiaprima)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "UPDATE mat_materiaprima SET mat_nome=?nome, mat_descricao=?descricao, mat_status=?status, mat_quantidade=?quantidade WHERE mat_codigo=?codigo";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", materiaprima.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?descricao", materiaprima.Descricao));
            objCommand.Parameters.Add(Mapped.Parameter("?status", materiaprima.Status));          
            objCommand.Parameters.Add(Mapped.Parameter("?quantidade", materiaprima.Quantidade));
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", materiaprima.Codigo));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }
        //delete

        //construtor
        public MateriaPrimaBD()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}