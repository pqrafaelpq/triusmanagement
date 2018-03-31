using kifome.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kifome.Persistencia
{
    /// <summary>
    /// Descrição resumida de CanceladoBD
    /// </summary>
    public class CanceladoBD
    {
        //insert
        public bool Insert(Cancelado cancelado)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO can_cancelado(can_motivo, can_pedido) VALUES (?motivo, ?pedido)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?motivo", cancelado.Motivo));
            objCommand.Parameters.Add(Mapped.Parameter("?pedido", cancelado.Pedido));
           
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }


        public CanceladoBD()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}