using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using kifome;

public partial class Pages_Administrador_CadastroMateriaPrima : System.Web.UI.Page
{
    private void LimparCampos()
    {
        //remove seleção do ddl
        for (int i = 0; i < ddlStatus.Items.Count; i++)
        {
            ddlStatus.Items[i].Selected = false;
        }
        //coloca o "Selecione" selecionado
        ddlStatus.Items[0].Selected = true;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        //variavel verificar falso verdadeiro
        bool iscadastrar = false;

        //WebSite1.Classes.Login login = new WebSite1.Classes.Login();
        MateriaPrima materia = new MateriaPrima();
        materia.Nome = txtNome.Text;
        //materia.Quantidade = Convert.ToDouble(txtQuantidade.Text);
        materia.Quantidade = 0;
        materia.Descricao = txtDescricao.Text;
        materia.Status = ddlStatus.Text;
        MateriaPrimaBD bd = new MateriaPrimaBD();

        //buscando email do BD
        System.Data.IDbConnection objConexao;
        System.Data.IDbCommand objCommand;
        System.Data.IDataReader objDataReader;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT mat_nome FROM mat_materiaprima ", objConexao);
        objDataReader = objCommand.ExecuteReader();

        //laço repetição
        while (objDataReader.Read())
        {
            //se o campo for igual do BD 
           // if (txtNome.Text == objDataReader["mat_nome"].ToString())
           if (string.Equals(txtNome.Text, objDataReader["mat_nome"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('A matéria prima já existe!');", true);
                iscadastrar = true;
                break;
            }
        }

        if (iscadastrar == false)
        {
            if (bd.Insert(materia))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
                txtNome.Text = "";
               // txtQuantidade.Text = "";
                txtDescricao.Text = "";
                txtNome.Focus();
                LimparCampos();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Erro ao salvar! Contate o suporte!');", true);
            }
        }
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
}