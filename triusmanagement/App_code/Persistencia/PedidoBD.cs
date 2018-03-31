using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using kifome.Classes;


namespace kifome.Persistencia
{
    /// <summary>
    /// Descrição resumida de PedidoBD
    /// </summary>
    public class PedidoBD
    {
        //métodos        
        
        //insert
        public bool Insert(Pedido pedido)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO ped_pedido(ped_nomecliente, ped_contatocliente, ped_guid, ped_quantidadetotal, ped_valortotal, ped_status, ped_dataentrada, ped_datapronto, ped_dataprevista, ped_qtddias, ped_cont) VALUES (?nomecliente, ?contatocliente, ?produto, ?quantidadetotal, ?valortotal, ?status, ?dataentrada , ?datapronto, ?dataprevista, ?qtddias, ?cont)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?nomecliente", pedido.NomeCliente));
            objCommand.Parameters.Add(Mapped.Parameter("?contatocliente", pedido.ContatoCliente));            
            objCommand.Parameters.Add(Mapped.Parameter("?produto", pedido.Produto));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidadetotal", pedido.QuantidadeTotal));
            objCommand.Parameters.Add(Mapped.Parameter("?valortotal", pedido.ValorTotal));
            objCommand.Parameters.Add(Mapped.Parameter("?status", pedido.Status));
            objCommand.Parameters.Add(Mapped.Parameter("?dataentrada", pedido.DataEntrada));
            objCommand.Parameters.Add(Mapped.Parameter("?dataprevista", pedido.DataPrevista));
            objCommand.Parameters.Add(Mapped.Parameter("?datapronto", pedido.DataPronto));
            objCommand.Parameters.Add(Mapped.Parameter("?qtddias", pedido.QtdDias));
            objCommand.Parameters.Add(Mapped.Parameter("?cont", pedido.Cont));

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
            objCommand = Mapped.Command("SELECT * FROM ped_pedido ORDER BY ped_codigo", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        public DataSet SelectAllAguardando()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_status='Aguardando' ORDER BY ped_dataprevista", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        public DataSet SelectAllPronto()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_status='Pronto' ORDER BY ped_codigo", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        public DataSet SelectAllCancelado()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_status='Cancelado' ORDER BY ped_codigo", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }


        public DataSet SelectGrafico()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            //objCommand = Mapped.Command("SELECT sum(if(month(ped_dataentrada)=1, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=2, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=3, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=4, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=5, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=6, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=7, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=8, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=9, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=10, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=11, ped_valortotal, 0)) as 'M', sum(if(month(ped_dataentrada)=12, ped_valortotal, 0)) as 'M' FROM ped_pedido WHERE EXTRACT(YEAR FROM ped_dataentrada) BETWEEN 2017 and 2017 and ped_status='Pronto'", objConexao);
            objCommand = Mapped.Command("SELECT ped_status, ROUND(sum(if(month(ped_dataentrada)=1, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=2, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=3, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=4, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=5, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=6, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=7, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=8, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=9, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=10,ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=11, ped_valortotal, 0))) as 'M', ROUND(sum(if(month(ped_dataentrada)=12, ped_valortotal, 0))) as 'M' FROM ped_pedido WHERE EXTRACT(YEAR FROM ped_dataentrada) BETWEEN 2017 and 2017 and ped_status='Pronto'", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

       

        /*public DataSet SelectCount()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT COUNT(*) AS total FROM ped_pedido", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }*/

        //select
        public ItensPedido Select(string id)
        {
            ItensPedido obj = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ite_itenspedido WHERE ite_guid = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj.Produto = Convert.ToString(objDataReader["ite_produto"]);
                obj.Quantidade = Convert.ToInt32(objDataReader["ite_quantidade"]);
                
            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }

        //SelectPorData
        public DataSet SelectData(DateTime inicio, DateTime final)
        {
            DataSet ds = new DataSet();
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            //objCommand = Mapped.Command("SELECT * FROM ent_entradamateria where ent_data between ?inicio and ?final", objConexao);
            objCommand = Mapped.Command("SELECT * FROM ped_pedido where ped_status = 'Pronto' and ped_dataentrada between '" + inicio.ToString("yyyy-MM-dd") + "' and '" + final.ToString("yyyy-MM-dd") + "'", objConexao);
            //objCommand.Parameters.Add(Mapped.Parameter("?inicio", inicio));
            //objCommand.Parameters.Add(Mapped.Parameter("?final", final));
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        //SelectPorDataPronto
        public DataSet SelectDataPronto(DateTime inicio, DateTime final)
        {
            DataSet ds = new DataSet();
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            //objCommand = Mapped.Command("SELECT * FROM ent_entradamateria where ent_data between ?inicio and ?final", objConexao);
            objCommand = Mapped.Command("SELECT * FROM ped_pedido where ped_dataentrada between '" + inicio.ToString("yyyy-MM-dd") + "' and '" + final.ToString("yyyy-MM-dd") + "'", objConexao);
            //objCommand.Parameters.Add(Mapped.Parameter("?inicio", inicio));
            //objCommand.Parameters.Add(Mapped.Parameter("?final", final));
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }


        //SelectDDL
        public DataSet SelectDDL(string codigo)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ite_itenspedido WHERE ite_guid = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", codigo));
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }


        //SelectGuid        
        public Pedido SelectGuid(int id)
        {
            Pedido obj = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_codigo = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj = new Pedido();
                obj.Codigo = Convert.ToInt32(objDataReader["ped_codigo"]);
                obj.Produto = Convert.ToString(objDataReader["ped_guid"]);

            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }

        public Pedido SelectStatus(int id)
        {
            Pedido obj = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_codigo = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                obj = new Pedido();
                obj.Codigo = Convert.ToInt32(objDataReader["ped_codigo"]);
                obj.Status = Convert.ToString(objDataReader["ped_status"]);

            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }

        //selectPedido
        public Pedido SelectPedido(int codigo2)
        {
            Pedido obj = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_codigo = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", codigo2));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {

                obj = new Pedido();
                obj.Codigo = Convert.ToInt32(objDataReader["ped_codigo"]);
                obj.NomeCliente = Convert.ToString(objDataReader["ped_nomecliente"]);
                obj.ContatoCliente = Convert.ToString(objDataReader["ped_contatocliente"]);
                obj.Produto = Convert.ToString(objDataReader["ped_guid"]);
                obj.QuantidadeTotal = Convert.ToInt32(objDataReader["ped_quantidadetotal"]);
                obj.ValorTotal = Convert.ToDouble(objDataReader["ped_valortotal"]);
                obj.Status = Convert.ToString(objDataReader["ped_status"]);
                obj.DataEntrada = Convert.ToDateTime(objDataReader["ped_dataentrada"]);
                obj.DataPrevista = Convert.ToDateTime(objDataReader["ped_dataprevista"]);
                obj.DataPronto = Convert.ToDateTime(objDataReader["ped_datapronto"]);
                obj.QtdDias = Convert.ToInt32(objDataReader["ped_qtddias"]);

            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }

        public Pedido SelectPorGuid(string guide)
        {
            Pedido obj = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM ped_pedido WHERE ped_guid = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", guide));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {

                obj = new Pedido();
                obj.Codigo = Convert.ToInt32(objDataReader["ped_codigo"]);
                obj.NomeCliente = Convert.ToString(objDataReader["ped_nomecliente"]);
                obj.ContatoCliente = Convert.ToString(objDataReader["ped_contatocliente"]);
                obj.Produto = Convert.ToString(objDataReader["ped_guid"]);
                obj.QuantidadeTotal = Convert.ToInt32(objDataReader["ped_quantidadetotal"]);
                obj.ValorTotal = Convert.ToDouble(objDataReader["ped_valortotal"]);
                obj.Status = Convert.ToString(objDataReader["ped_status"]);
                obj.DataEntrada = Convert.ToDateTime(objDataReader["ped_dataentrada"]);
                obj.DataPrevista = Convert.ToDateTime(objDataReader["ped_dataprevista"]);
                obj.DataPronto = Convert.ToDateTime(objDataReader["ped_datapronto"]);
                obj.QtdDias = Convert.ToInt32(objDataReader["ped_qtddias"]);

            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return obj;
        }


        //update
        public bool Update(Pedido pedido)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "UPDATE ped_pedido SET ped_nomecliente=?nomecliente, ped_contatocliente=?contatocliente, ped_guid=?guid, ped_quantidadetotal=?quantidadetotal, ped_valortotal=?valortotal, ped_status=?status, ped_dataentrada=?dataentrada, ped_datapronto=?datapronto, ped_dataprevista=?dataprevista, ped_qtddias=?qtddias WHERE ped_codigo = ?codigo";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?nomecliente", pedido.NomeCliente));
            objCommand.Parameters.Add(Mapped.Parameter("?contatocliente", pedido.ContatoCliente));
            objCommand.Parameters.Add(Mapped.Parameter("?guid", pedido.Produto));
            objCommand.Parameters.Add(Mapped.Parameter("?quantidadetotal", pedido.QuantidadeTotal));
            objCommand.Parameters.Add(Mapped.Parameter("?valortotal", pedido.ValorTotal));
            objCommand.Parameters.Add(Mapped.Parameter("?status", pedido.Status));
            objCommand.Parameters.Add(Mapped.Parameter("?dataentrada", pedido.DataEntrada));
            objCommand.Parameters.Add(Mapped.Parameter("?dataprevista", pedido.DataPrevista));
            objCommand.Parameters.Add(Mapped.Parameter("?datapronto", pedido.DataPronto));
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", pedido.Codigo));
            objCommand.Parameters.Add(Mapped.Parameter("?qtddias", pedido.QtdDias));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return true;
        }
        
        //delete

        //construtor
        public PedidoBD()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}