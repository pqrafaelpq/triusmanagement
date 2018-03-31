using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using System.Data;

public partial class Pages_Administrador_ListaPedidos : System.Web.UI.Page
{



    private void CarregaGrid()
    {
        if (rbTodos.Checked)
        {
            PedidoBD bd = new PedidoBD();
            DataSet ds = bd.SelectAll();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "pronto('Lista de Pedidos - Kifome Salgados');", true);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();


            GridView2.DataSource = null;
            GridView2.DataBind();

        }
        if (rbAguardando.Checked)
        {
            PedidoBD bd = new PedidoBD();
            DataSet ds = bd.SelectAllAguardando();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "pronto('em Produção','Relatório de todos os pedidos ainda não finalizados. ');", true);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();

            GridView2.DataSource = null;
            GridView2.DataBind();
        }
        if (rbPronto.Checked)
        {
            PedidoBD bd = new PedidoBD();
            DataSet ds = bd.SelectAllPronto();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "pronto('Prontos','Relatório de todos os pedidos finalizados.');", true);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();

            GridView2.DataSource = null;
            GridView2.DataBind();
        }
        if (rbCancelado.Checked)
        {
            PedidoBD bd = new PedidoBD();
            DataSet ds = bd.SelectAllCancelado();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "pronto('Cancelados','Relatório de todos os pedidos cancelados no período.');", true);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();

            GridView2.DataSource = null;
            GridView2.DataBind();
        }


    }

    private bool IsAdministrador(int tipo)
    {
        bool retorno = false;
        if (tipo == 0)
        {
            retorno = true;
        }
        return retorno;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int codigo = Convert.ToInt32(Session["codigo"]);
        if (codigo == 0)
        {
            Response.Redirect("../Erro/PaginaPrincipal.aspx");
        }

        FuncionarioBD bd = new FuncionarioBD();
        Funcionario funcionario = bd.Select(codigo);

        if (!IsAdministrador(funcionario.Tipo))
        {
            Response.Redirect("../Erro/PaginaPrincipal.aspx");
        }
        else
        {
          //  lblTitulo.Text = "Bem-vindo! Você está logado como administrador com o usuário " + funcionario.Nome;
            //   lblmenu.Text = funcionario.Nome;
        }

    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string codigo = null;
        string codigao = null;
        double atraso = 0.00;
        string atrasado = null;
        int codigo2 = 0;
        switch (e.CommandName)
        {
            case "detalhes":

                codigo = Convert.ToString(e.CommandArgument);
                codigao = Convert.ToString(e.CommandArgument);
                

                ItensPedidoBD bd = new ItensPedidoBD();
                DataSet ds = bd.SelectAllItensPedido(codigo);

                PedidoBD bdstatuss = new PedidoBD();
                Pedido pedidoo = bdstatuss.SelectPorGuid(codigao);
                lblCodigo.Text = pedidoo.Codigo.ToString();
                lblNomeCliente.Text = pedidoo.NomeCliente;
                lblContatoCliente.Text = pedidoo.ContatoCliente;
                lblQtdTotal.Text = pedidoo.QuantidadeTotal.ToString();
                lblValorTotal.Text = "R$ "+pedidoo.ValorTotal.ToString();
                lblStatus.Text = pedidoo.Status;
                lblEntrada.Text = pedidoo.DataEntrada.ToString("dd/MM/yyyy");
                lblEntrega.Text = pedidoo.DataPrevista.ToString("dd/MM/yyyy");
                lblPronto.Text = pedidoo.DataPronto.ToString("dd/MM/yyyy");
                lblAtrasado.Text = "";

                DateTime hoje = DateTime.Now;

                if (string.Equals(lblStatus.Text, "Aguardando", StringComparison.OrdinalIgnoreCase))
                {

                    DateTime datamenos = pedidoo.DataPrevista.AddHours(-23);
                    if (hoje > datamenos)
                    {
                        TimeSpan tempoatraso = hoje - pedidoo.DataPrevista;
                        atraso = tempoatraso.TotalDays;
                        atrasado = (Math.Round(atraso, 1)).ToString();
                        lblAtrasado.Text = "Pedido está "+atrasado+" dias atrasado!";

                        if (atraso <1.0)
                        {
                            lblAtrasado.Text = "O prazo do pedido vence hoje!";
                        }

                    }
                    lblPronto.Text = "Pedido ainda não está pronto";
                }

                if (pedidoo.DataPronto > pedidoo.DataPrevista)
                {
                    TimeSpan tempoatraso = pedidoo.DataPronto - pedidoo.DataPrevista;
                    atraso = tempoatraso.TotalDays;
                    atrasado = (Math.Round(atraso, 1)).ToString();

                    lblAtrasado.Text = "Pedido " + atrasado + " dias atrasado!";
                    lblPronto.Text = pedidoo.DataPronto.ToString("dd/MM/yyyy");

                    
                }

               

           


                GridView2.DataSource = ds.Tables[0].DefaultView;
                GridView2.DataBind();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modaldet();", true);

                break;
            case "Status":

                codigo2 = Convert.ToInt32(e.CommandArgument);
                PedidoBD bdstatus = new PedidoBD();
                Pedido pedido = bdstatus.SelectStatus(codigo2);

                string status = pedido.Status;

                if (status == "Pronto" || status == "Cancelado")
                {
                   // lblMensagem.Text = "O status já foi alterado. O mesmo não pode ser alterado novamente.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('O status já foi alterado! Não é possível alterá-lo novamente.');", true);
                }
                else
                {
                    codigo2 = Convert.ToInt32(e.CommandArgument);
                    Session["ID"] = codigo2;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modalstatus();", true);
                }
                break;
            default:
                break;
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void rbTodos_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void rbAguardando_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void rbPronto_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void rbCancelado_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();

    }
}
