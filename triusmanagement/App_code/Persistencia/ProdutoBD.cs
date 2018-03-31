using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using kifome.Classes;
using System.Data;

/// <summary>
/// Descrição resumida de ProdutoBD
/// </summary>
/// 

namespace kifome.Persistencia
{
    public class ProdutoBD
    {
        //métodos

        //insert
        public bool Insert(Produto produto)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO pro_produto(pro_nome, pro_quantidade, pro_valorcento, pro_descricao, pro_status) VALUES (?nome, ?quantidade, ?valorcento, ?descricao, ?status)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", produto.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidade", produto.Quantidade));
            objCommand.Parameters.Add(Mapped.Parameter("?valorcento", produto.ValorCento));
            objCommand.Parameters.Add(Mapped.Parameter("?descricao", produto.Descricao));
            objCommand.Parameters.Add(Mapped.Parameter("?status", produto.Status));
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }

        //selectall
        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM pro_produto  ORDER BY pro_nome", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }
        //select
        public Produto Select(int codigo)
        {
            Produto obj = null;
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM pro_produto WHERE pro_codigo = ?codigo", objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?codigo", codigo));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj = new Produto();
                obj.Codigo = Convert.ToInt32(objDataReader["pro_codigo"]);
                obj.ValorCento = Convert.ToDouble(objDataReader["pro_valorcento"]);
               
            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }
        //update

        //select
        public Produto SelectProduto(int codigo)
        {
            Produto obj = null;
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM pro_produto WHERE pro_codigo = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", codigo));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {

                obj = new Produto();
                obj.Codigo = Convert.ToInt32(objDataReader["pro_codigo"]);
                obj.Nome = Convert.ToString(objDataReader["pro_nome"]);
                obj.Quantidade = Convert.ToInt32(objDataReader["pro_quantidade"]);
                obj.ValorCento = Convert.ToDouble(objDataReader["pro_valorcento"]);
                obj.Descricao = Convert.ToString(objDataReader["pro_descricao"]);
                obj.Status = Convert.ToString(objDataReader["pro_status"]);
            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }
        
        //update
        public bool Update(Produto produto)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "UPDATE pro_produto SET pro_nome=?nome, pro_quantidade=?quantidade, pro_valorcento=?valorcento, pro_descricao=?descricao, pro_status=?status WHERE pro_codigo = ?codigo";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", produto.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidade", produto.Quantidade));
            objCommand.Parameters.Add(Mapped.Parameter("?valorcento", produto.ValorCento));
            objCommand.Parameters.Add(Mapped.Parameter("?descricao", produto.Descricao));
            objCommand.Parameters.Add(Mapped.Parameter("?status", produto.Status));
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", produto.Codigo));
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }
        //delete

        //construtor
        public ProdutoBD()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}