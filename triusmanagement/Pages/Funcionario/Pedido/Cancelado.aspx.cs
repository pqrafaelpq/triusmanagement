using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Pedido_Cancelado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PedidoBD bd = new PedidoBD();
            Pedido pedido = bd.SelectGuid(Convert.ToInt32(Session["ID"]));
            lblGuid.Text = pedido.Produto;
        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        if (txtMotivo.Text.Trim() == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe o motivo!');", true);
            return;
        }



        Cancelado cancelado = new Cancelado();
        cancelado.Motivo = txtMotivo.Text;
        cancelado.Pedido = lblGuid.Text;

        CanceladoBD bd = new CanceladoBD();
        if (bd.Insert(cancelado))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
            txtMotivo.Text = "";
            txtMotivo.Focus();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Ocorreu um erro ao salvar!');", true);
        }
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
}