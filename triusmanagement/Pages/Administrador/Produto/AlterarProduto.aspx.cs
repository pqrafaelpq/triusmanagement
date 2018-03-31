using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Produto_AlterarProduto : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ProdutoBD bd = new ProdutoBD();
            Produto produto = bd.SelectProduto(Convert.ToInt32(Session["ID"]));
            lblNome.Text = produto.Nome;
            lblQuantidade.Text = produto.Quantidade.ToString();
            txtValor.Text = produto.ValorCento.ToString();
            lblDescricao.Text = produto.Descricao;
            ddlStatus.Text = produto.Status;
        }

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        ProdutoBD bd = new ProdutoBD();
        Produto produto = bd.SelectProduto(Convert.ToInt32(Session["ID"]));
        produto.Nome = lblNome.Text;
        produto.Quantidade = Convert.ToInt32(lblQuantidade.Text);
        produto.ValorCento = Convert.ToDouble(txtValor.Text);
        produto.Descricao = lblDescricao.Text;
        produto.Status = ddlStatus.Text;

        if (bd.Update(produto))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
            txtValor.Focus();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Ocorreu um erro! Contate o suporte!');", true);
        }

    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
}