using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using System.Data;

public partial class Pages_Administrador_Pedido_AlterarStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblAtrasado.Text = "";
            PedidoBD bd = new PedidoBD();
            Pedido pedido = bd.SelectPedido(Convert.ToInt32(Session["ID"]));
            lblNomeCliente.Text = pedido.NomeCliente;
            lblContatoCliente.Text = pedido.ContatoCliente;
            lblGuid.Text = pedido.Produto;
            lblQuantidadeTotal.Text = pedido.QuantidadeTotal.ToString();
            lblValorTotal.Text = pedido.ValorTotal.ToString();
            ddlStatus.Text = pedido.Status;
            lblDataEntrada.Text = pedido.DataEntrada.ToString();
            lblDataPrevista.Text = pedido.DataPrevista.ToString();
            DateTime datapronto = pedido.DataPronto;
            int qtddias = pedido.QtdDias;

            DateTime hoje = DateTime.Now;
            Double atraso = 0;
            string atrasado = null;
            DateTime datamenos = pedido.DataPrevista.AddHours(-23);
            if (hoje > datamenos)
            {
                TimeSpan tempoatraso = hoje - pedido.DataPrevista;
                atraso = tempoatraso.TotalDays;
                atrasado = (Math.Round(atraso, 1)).ToString();
                lblAtrasado.Text = "Pedido está " + atrasado + " dias atrasado!";

                if (atraso < 1.0)
                {
                    lblAtrasado.Text = "O prazo do pedido vence hoje!";
                }

            }


            Carrega();
        }
    }

    private void Carrega()
    {
        string codigo = lblGuid.Text;
        ItensPedidoBD bd = new ItensPedidoBD();
        DataSet ds = bd.SelectAllItensPedido(codigo);

        gvItensPedido.DataSource = ds.Tables[0].DefaultView;
        gvItensPedido.DataBind();

    }



    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        //DateTime hoje = DateTime.Now;
        //DateTime datapresvista = lblDataPrevista.Text;

        //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('chegou');", true);
        if (ddlStatus.Text != "Aguardando")
        {




            if (DateTime.Now > Convert.ToDateTime(lblDataPrevista.Text))
            {
                //Verificar a qtd de dias de atraso*******
                DateTime hoje = DateTime.Now;

                TimeSpan qtddias = hoje - (Convert.ToDateTime(lblDataPrevista.Text));

                //TimeSpan tempoatraso = hoje - (Convert.ToDateTime(lblDataPrevista.Text));
                //atraso = tempoatraso.Days;
                //atrasado = (Math.Round(atraso, 1)).ToString();
                //qtddias = Int32.Parse(atrasado);


                PedidoAtrasado pedidoatrasado = new PedidoAtrasado();
                pedidoatrasado.NomeCliente = lblNomeCliente.Text;
                pedidoatrasado.ContatoCliente = lblContatoCliente.Text;
                pedidoatrasado.Produto = lblGuid.Text;
                pedidoatrasado.QuantidadeTotal = Convert.ToInt32(lblQuantidadeTotal.Text);
                pedidoatrasado.ValorTotal = Convert.ToDouble(lblValorTotal.Text);
                pedidoatrasado.Status = ddlStatus.Text;
                pedidoatrasado.DataEntrada = Convert.ToDateTime(lblDataEntrada.Text);
                pedidoatrasado.DataPrevista = Convert.ToDateTime(lblDataPrevista.Text);
                pedidoatrasado.DataPronto = DateTime.Now;
                pedidoatrasado.QtdDias = qtddias.Days;

                PedidoAtrasadoBD bdPea = new PedidoAtrasadoBD();
                if (bdPea.Insert(pedidoatrasado))
                {
                    lblMensagem.Text = "Pedido Atrasado Salvo com sucesso";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe o produto');", true);
                }


                TimeSpan qtddias2 = hoje - (Convert.ToDateTime(lblDataEntrada.Text));

                PedidoBD bd = new PedidoBD();
                Pedido pedido = bd.SelectPedido(Convert.ToInt32(Session["ID"]));
                pedido.NomeCliente = lblNomeCliente.Text;
                pedido.ContatoCliente = lblContatoCliente.Text;
                pedido.Produto = lblGuid.Text;
                pedido.QuantidadeTotal = Convert.ToInt32(lblQuantidadeTotal.Text);
                pedido.ValorTotal = Convert.ToDouble(lblValorTotal.Text);
                pedido.Status = ddlStatus.Text;
                pedido.DataEntrada = Convert.ToDateTime(lblDataEntrada.Text);
                pedido.DataPrevista = Convert.ToDateTime(lblDataPrevista.Text);
                pedido.DataPronto = DateTime.Now;
                pedido.QtdDias = qtddias2.Days;

                if (bd.Update(pedido))
                {
                    lblMensagem.Text = "Status alterado com sucesso";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe o produto');", true);
                }

                ItensPedidoBD itensbd = new ItensPedidoBD();
                ItensPedido itenspedido = itensbd.Select(lblGuid.Text);
                itenspedido.Status = ddlStatus.Text;
                itenspedido.PedCodigo = lblGuid.Text;

                if (itensbd.Update(itenspedido))
                {
                    lblMensagem.Text = "Status alterado com sucesso";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe o produto');", true);
                }
            }
            else
            {
                //Verificar a qtd de dias
                DateTime hoje = DateTime.Now;
                //  TimeSpan qtddias = Convert.ToDateTime(lblDataPrevista) - hoje;
                TimeSpan qtddiass = (Convert.ToDateTime(lblDataPrevista.Text)) - hoje;

                PedidoBD bd = new PedidoBD();
                Pedido pedido = bd.SelectPedido(Convert.ToInt32(Session["ID"]));
                pedido.NomeCliente = lblNomeCliente.Text;
                pedido.ContatoCliente = lblContatoCliente.Text;
                pedido.Produto = lblGuid.Text;
                pedido.QuantidadeTotal = Convert.ToInt32(lblQuantidadeTotal.Text);
                pedido.ValorTotal = Convert.ToDouble(lblValorTotal.Text);
                pedido.Status = ddlStatus.Text;
                pedido.DataEntrada = Convert.ToDateTime(lblDataEntrada.Text);
                pedido.DataPrevista = Convert.ToDateTime(lblDataPrevista.Text);
                pedido.DataPronto = DateTime.Now;
                pedido.QtdDias = qtddiass.Days;

                if (bd.Update(pedido))
                {
                    lblMensagem.Text = "Status alterado com sucesso";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Ocorreu um erro. Contate o suporte!');", true);
                }
            }

            if (ddlStatus.Text == "Pronto")
            {
                int codigo = Convert.ToInt32(Session["ID"]);
                Session["ID"] = codigo;
                Response.Redirect("Pronto.aspx");

            }

            if (ddlStatus.Text == "Cancelado")
            {
                int codigo = Convert.ToInt32(Session["ID"]);
                Session["ID"] = codigo;
                Response.Redirect("Cancelado.aspx");

            }
        }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe o status!');", true);

     
    }
    
    //protected void lbVoltar_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("../PaginaPrincipal.aspx");
    //}
}