using kifome;
using kifome.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de SaidaMateriaBD
/// </summary>
public class SaidaMateriaBD
{
    //métodos

    //insert
    public bool Insert(SaidaMateria saidamateria)
    {
        try
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO sai_saidamateria(sai_materia, sai_quantidade, sai_data, sai_funcionario) VALUES (?materia, ?quantidade, ?data, ?funcionario)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?materia", saidamateria.Materia));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidade", saidamateria.Quantidade));
            objCommand.Parameters.Add(Mapped.Parameter("?data", saidamateria.Data));
            objCommand.Parameters.Add(Mapped.Parameter("?funcionario", saidamateria.Funcionario));
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }

    //selectall
    public DataSet SelectAllSaida()
    {
        DataSet ds = new DataSet();
        System.Data.IDbConnection objConexao;
        System.Data.IDbCommand objCommand;
        System.Data.IDataAdapter objDataAdapter;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT * FROM sai_saidamateria", objConexao);
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
    public SaidaMateriaBD()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }
}