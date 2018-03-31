using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using System.Data;

public partial class Pages_Administrador_PaginaPrincipal : System.Web.UI.Page
{
    private bool IsCliente(int tipo)
    {
        bool retorno = false;
        if (tipo == 1)
        {
            retorno = true;
        }
        return retorno;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        int codigo = Convert.ToInt32(Session["codigo"]);
        
        FuncionarioBD bd = new FuncionarioBD();
        Funcionario funcionario = bd.Select(codigo);
        
        if (!IsCliente(funcionario.Tipo))
        {
            Response.Redirect("../Erro/PaginaPrincipal.aspx");
        }
        else
        {
            lblTitulo.Text = "Bem-vindo! Você está logado como funcionário com o usuário " + funcionario.Nome;
            lblmenu.Text = funcionario.Nome;
        }

        ItensPedidoBD gridbd = new ItensPedidoBD();
        DataSet ds = gridbd.SelectGrafico();
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();

        PedidoBD graficobd = new PedidoBD();
        DataSet ds2 = graficobd.SelectGrafico();
        GridView2.DataSource = ds2.Tables[0].DefaultView;
        GridView2.DataBind();

        //CarregaGrafico();



        PedidoBD aguardandoBD = new PedidoBD();
        DataSet ds3 = aguardandoBD.SelectAllAguardando();
        GridView3.DataSource = ds3.Tables[0].DefaultView;
        GridView3.DataBind();


    }

    protected void lbSair_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("../Login.aspx");
    }
    protected void lbCadastroFuncionario_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Administrador/Funcionario/CadastroFuncionario.aspx");
    }
    protected void lbMateria_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Administrador/MateriaPrima/CadastroMateriaPrima.aspx");
    }
    protected void lbProduto_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Administrador/Produto/CadastroProduto.aspx");
    }
    protected void lbEntradaMatéria_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Administrador/MateriaPrima/EntradaMateriaPrima.aspx");
    }

    protected void lbPedido_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Administrador/Pedido/Pedido.aspx");
    }

    protected void lbListadePedidos_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Funcionario/Pedido/ListaPedidos.aspx");
    }

    protected void lbListadeProdutos_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Administrador/Produto/ListaProduto.aspx");
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string codigo = null;
        string codigao = null;
        double atraso = 0.00;
        string atrasado = null;
        //  int codigo2 = 0;
        // Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modaldetalhes();", true);
        switch (e.CommandName)
        {
            case "detalhes":

                codigo = Convert.ToString(e.CommandArgument);
                codigao = Convert.ToString(e.CommandArgument);


                ItensPedidoBD bd4 = new ItensPedidoBD();
                DataSet ds4 = bd4.SelectAllItensPedido(codigo);

                PedidoBD bdstatuss = new PedidoBD();
                Pedido pedidoo = bdstatuss.SelectPorGuid(codigao);
                lblCodigo.Text = pedidoo.Codigo.ToString();
                lblNomeCliente.Text = pedidoo.NomeCliente;
                lblContatoCliente.Text = pedidoo.ContatoCliente;
                lblQtdTotal.Text = pedidoo.QuantidadeTotal.ToString();
                lblValorTotal.Text = "R$ " + pedidoo.ValorTotal.ToString();
                lblStatus.Text = pedidoo.Status;
                lblEntrada.Text = pedidoo.DataEntrada.ToString("dd/MM/yyyy");
                lblEntrega.Text = pedidoo.DataPrevista.ToString("dd/MM/yyyy");
                lblPronto.Text = pedidoo.DataPronto.ToString("dd/MM/yyyy");
                lblAtrasado.Text = "";

                DateTime hoje = DateTime.Now;

                if (string.Equals(lblStatus.Text, "Aguardando", StringComparison.OrdinalIgnoreCase))
                {
                    if (hoje > pedidoo.DataPrevista)
                    {
                        TimeSpan tempoatraso = hoje - pedidoo.DataPrevista;
                        atraso = tempoatraso.TotalDays;
                        atrasado = (Math.Round(atraso, 1)).ToString();
                        lblAtrasado.Text = "Pedido está " + atrasado + " dias atrasado!";

                        if (atraso < 1.0)
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



                GridView4.DataSource = ds4.Tables[0].DefaultView;
                GridView4.DataBind();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modaldetalhes();", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "novoPedido();", true);
                lblTitulo.Text = "chegou";
                break;
            //case "Status":

            //    codigo2 = Convert.ToInt32(e.CommandArgument);
            //    PedidoBD bdstatus = new PedidoBD();
            //    Pedido pedido = bdstatus.SelectStatus(codigo2);

            //    string status = pedido.Status;

            //    if (status == "Pronto" || status == "Cancelado")
            //    {
            //        // lblMensagem.Text = "O status já foi alterado. O mesmo não pode ser alterado novamente.";
            //    //  Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('O status já foi alterado! Não é possível alterá-lo novamente.');", true);
            //    }
            //    else
            //    {
            //        codigo2 = Convert.ToInt32(e.CommandArgument);
            //        Session["ID"] = codigo2;
            //     //   Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modalstatus();", true);
            //    }
            //    break;
            default:
                break;
        }

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}