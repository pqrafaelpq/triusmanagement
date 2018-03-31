using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Pedido_ListaItensPedido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CarregaProduto();
            ddlProduto.Focus();
        }
    }

    private void CarregaProduto()
    {
        ProdutoBD bd = new ProdutoBD();
        DataSet ds = bd.SelectAll();
        ddlProduto.DataSource = ds.Tables[0].DefaultView;
        ddlProduto.DataTextField = "pro_nome";
        ddlProduto.DataValueField = "pro_codigo";
        ddlProduto.DataBind();
        ddlProduto.Items.Insert(0, new ListItem("Selecione", "0"));
    }    

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }

    protected void ddlProduto_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlProduto.SelectedItem.Text != "Selecione")
        {
            string produto = ddlProduto.SelectedItem.Text;

            ItensPedidoBD bd = new ItensPedidoBD();
            DataSet ds = bd.SelectAllProduto(produto);

            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();

            string qtd = ds.Tables[0].Compute("Sum (ite_quantidade)","").ToString();
                
            lblMensagem.Text = "Quantidade Total de " + produto + ": " + qtd;
        }
        
    }
}