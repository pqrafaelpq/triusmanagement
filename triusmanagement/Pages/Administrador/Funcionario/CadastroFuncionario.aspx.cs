using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using kifome;

public partial class Pages_Administrador_CadastroFuncionario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        //variavel verificar falso verdadeiro
        bool iscadastrar = false;

        Funcionario funcionario = new Funcionario();
        funcionario.Nome = txtNome.Text;
        funcionario.Email = txtEmail.Text;
        funcionario.Senha = txtSenha.Text;
        funcionario.Salario = Convert.ToDouble(txtSalario.Text);
        funcionario.Cracha = txtCracha.Text;
        funcionario.Tipo = Convert.ToInt32(ddlTipo.Text);
        FuncionarioBD bd = new FuncionarioBD();

        //buscando email e cracha do BD
        System.Data.IDbConnection objConexao;
        System.Data.IDbCommand objCommand;
        System.Data.IDataReader objDataReader;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT fun_email, fun_cracha FROM fun_funcionario ", objConexao);
        objDataReader = objCommand.ExecuteReader();

        //laço repetição
        while (objDataReader.Read())
        {            
            //se o campo for igual do BD 
            if (txtEmail.Text == objDataReader["fun_email"].ToString())
            {
                // lblMensagem.Text = "Email já existente";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('O e-mail já existe');", true);
                iscadastrar = true;
                break;
            }
            //se o campo for igual do BD
            if (txtCracha.Text == objDataReader["fun_cracha"].ToString())
            {
              //  lblMensagem.Text = "Cracha já existente";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Cracha já existente');", true);
                iscadastrar = true;
                break;
            }
            //se o Senha for DIFERENTE do Confirme
            if (txtSenha.Text != txtConfirme.Text)
            {
                //lblMensagem.Text = "Senhas diferentes. As senha devem ser iguais.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('As senhas não coincidem');", true);
                iscadastrar = true;
                break;
            }
        }
       
        if (iscadastrar == false)
        {
            if (bd.Insert(funcionario))
            {
             
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
                txtNome.Text = "";
                txtEmail.Text = "";
                txtSenha.Text = "";
                txtCracha.Text = "";
                txtSalario.Text = "";
                txtConfirme.Text = "";
                txtNome.Focus();
            }
            else
            {
               // lblMensagem.Text = "Erro ao salvar.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Erro ao salvar');", true);
            }
        }
    }            

    protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }    
}