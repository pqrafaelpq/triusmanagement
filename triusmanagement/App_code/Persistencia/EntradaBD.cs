using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using kifome.Classes;
using System.Data;

/// <summary>
/// Descrição resumida de EntradaBD
/// </summary>
/// 
namespace kifome.Persistencia
{
    public class EntradaBD
    {
        //métodos

        //insert
        public bool Insert(EntradaMateria entrada)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO ent_entradamateria(ent_nome, ent_quantidade, ent_descricao, ent_valor, ent_data, ent_funcionario) VALUES (?nome, ?quantidade, ?descricao, ?valor, ?data, ?funcionario)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", entrada.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidade", entrada.Quantidade));
            objCommand.Parameters.Add(Mapped.Parameter("?descricao", entrada.Descricao));
            objCommand.Parameters.Add(Mapped.Parameter("?valor", entrada.Valor));
            objCommand.Parameters.Add(Mapped.Parameter("?data", entrada.Data));
            objCommand.Parameters.Add(Mapped.Parameter("?funcionario", entrada.Funcionario));
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }

        //selectall
        
        public DataSet SelectAllEntrada(DateTime inicio, DateTime final)
        {
            DataSet ds = new DataSet();
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            //objCommand = Mapped.Command("SELECT * FROM ent_entradamateria where ent_data between ?inicio and ?final", objConexao);
            objCommand = Mapped.Command("SELECT * FROM ent_entradamateria where ent_data between '" + inicio.ToString("yyyy-MM-dd") + "' and '" + final.ToString("yyyy-MM-dd") + "'", objConexao);
            //objCommand.Parameters.Add(Mapped.Parameter("?inicio", inicio));
            //objCommand.Parameters.Add(Mapped.Parameter("?final", final));
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        public DataSet SelectAllSaida(DateTime inicio, DateTime final)
        {
            DataSet ds = new DataSet();
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM sai_saidamateria where sai_data between '" + inicio.ToString("yyyy-MM-dd") + "' and '" + final.ToString("yyyy-MM-dd") + "'", objConexao);
            //objCommand.Parameters.Add(Mapped.Parameter("?inicio", inicio));
            //objCommand.Parameters.Add(Mapped.Parameter("?final", final));
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        //select

        //update

        //delete

        //construtor
        public EntradaBD()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}