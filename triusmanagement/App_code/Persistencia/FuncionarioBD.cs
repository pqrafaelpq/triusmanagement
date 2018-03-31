using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using kifome.Classes;
using System.Data;

/// <summary>
/// Descrição resumida de FuncionarioBD
/// </summary>
/// 

namespace kifome.Persistencia
{
    public class FuncionarioBD
    {
        //métodos
        public Funcionario Autentica(string email, string senha)
        {
            Funcionario obj = null;
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM fun_funcionario WHERE fun_email = ?email and fun_senha = ?senha", objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?email", email));
            objCommand.Parameters.Add(Mapped.Parameter("?senha", senha));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj = new Funcionario();
                obj.Codigo = Convert.ToInt32(objDataReader["fun_codigo"]);
                obj.Nome = Convert.ToString(objDataReader["fun_nome"]);
                obj.Email = Convert.ToString(objDataReader["fun_email"]);
                obj.Tipo = Convert.ToInt32(objDataReader["fun_tipo"]);
            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }

        //insert
        public bool Insert(Funcionario funcionario)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO fun_funcionario(fun_nome, fun_email, fun_senha, fun_tipo, fun_salario, fun_cracha) VALUES (?nome, ?email, ?senha, ?tipo, ?salario, ?cracha)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", funcionario.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?email", funcionario.Email));
            objCommand.Parameters.Add(Mapped.Parameter("?senha", funcionario.Senha));
            objCommand.Parameters.Add(Mapped.Parameter("?tipo", funcionario.Tipo));
            objCommand.Parameters.Add(Mapped.Parameter("?salario", funcionario.Salario));
            objCommand.Parameters.Add(Mapped.Parameter("?cracha", funcionario.Cracha));
            
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }
        //selectall

        //select
        public Funcionario Select(int codigo)
        {
            Funcionario obj = null;
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM fun_funcionario WHERE fun_codigo = ?codigo", objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?codigo", codigo));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj = new Funcionario();
                obj.Codigo = Convert.ToInt32(objDataReader["fun_codigo"]);
                obj.Nome = Convert.ToString(objDataReader["fun_nome"]);
                obj.Email = Convert.ToString(objDataReader["fun_email"]);
                obj.Tipo = Convert.ToInt32(objDataReader["fun_tipo"]);
            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }
        //update

        //delete

        //construtor
        public FuncionarioBD()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}