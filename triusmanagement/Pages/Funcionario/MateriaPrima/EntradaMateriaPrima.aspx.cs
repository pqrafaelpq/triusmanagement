using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using System.Data;

public partial class Pages_Administrador_EntradaMateriaPrima : System.Web.UI.Page
{
  
    private void CarregaMateria()
    {
        MateriaPrimaBD bd = new MateriaPrimaBD();
        DataSet ds = bd.SelectAll();
        ddlMateria.DataSource = ds.Tables[0].DefaultView;
        ddlMateria.DataTextField = "mat_nome";
        ddlMateria.DataValueField = "mat_codigo";
        ddlMateria.DataBind();
        ddlMateria.Items.Insert(0, new ListItem("Selecione", "0"));

    }

    private void LimparCampos()
    {
        txtQuantidade.Text = "";
        txtValor.Text = "";
        txtDescricao.Text = "";
        //remove seleção do ddl
        for (int i = 0; i < ddlMateria.Items.Count; i++)
        {
            ddlMateria.Items[i].Selected = false;
        }
        //coloca o "Selecione" selecionado
        ddlMateria.Items[0].Selected = true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
               
        //carrega somente a primeira vez
        if (!Page.IsPostBack)
        {
            CarregaMateria();
            ddlMateria.Focus();

        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        int codigo = Convert.ToInt32(Session["codigo"]);
        FuncionarioBD bdfun = new FuncionarioBD();
        Funcionario funcionario = bdfun.Select(codigo);

        EntradaMateria entradamateria = new EntradaMateria();
        entradamateria.Nome = ddlMateria.SelectedItem.Text;
        entradamateria.Descricao = txtDescricao.Text;
        entradamateria.Valor = Convert.ToDouble(txtValor.Text);
        entradamateria.Quantidade = Convert.ToInt32(txtQuantidade.Text);
        entradamateria.Data = DateTime.Now;
        entradamateria.Funcionario = funcionario.Nome;

        EntradaBD bd = new EntradaBD();

        if (bd.Insert(entradamateria))
        {
            
            string entradamateriaid = ddlMateria.SelectedItem.Value;

            MateriaPrimaBD materiaprimabd = new MateriaPrimaBD();
            MateriaPrima materiaprima = materiaprimabd.Select(Convert.ToInt32(entradamateriaid));
            materiaprima.Quantidade = materiaprima.Quantidade + Convert.ToInt32(txtQuantidade.Text);
            materiaprimabd.Update(materiaprima);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
            txtQuantidade.Text = "";
            txtDescricao.Text = "";
            txtValor.Text = "";
            txtQuantidade.Focus();
            LimparCampos();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Ocorreu um erro. Contate o suporte!');", true);
        }

    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }

    protected void lbCadastrar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../MateriaPrima/CadastroMateriaPrima.aspx");
    }
}