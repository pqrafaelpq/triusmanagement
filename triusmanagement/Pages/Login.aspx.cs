using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;

public partial class Pages_Login : System.Web.UI.Page
{
    private bool IsPreenchido(string str)
    {
        bool retorno = false;
        if (str != string.Empty)
        {
            retorno = true;
        }
        return retorno;
    }
    private bool UsuarioEncontrado(Funcionario funcionario)
    {
        bool retorno = false;
        if (funcionario != null)
        {
            retorno = true;
        }
        return retorno;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string senha = txtSenha.Text.Trim();
        if (!IsPreenchido(email))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Preencha o e-mail!');", true);
            //lblMensagem.Text = "Preencha o email";
            txtEmail.Focus();
            return;
        }
        if (!IsPreenchido(senha))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Preencha a senha!');", true);
            //lblMensagem.Text = "Preencha a senha";
            txtSenha.Focus();
            return;
        }
        FuncionarioBD bd = new FuncionarioBD();
        Funcionario funcionario = new Funcionario();
        funcionario = bd.Autentica(email, senha);
        if (!UsuarioEncontrado(funcionario))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Usuário ou senha inválidos!');", true);
           // lblMensagem.Text = "Usuário não encontrado";
           // txtEmail.Focus();
           return;
        }
        Session["codigo"] = funcionario.Codigo;
        switch (funcionario.Tipo)
        {
            case 0:
                Response.Redirect("Administrador/PaginaPrincipal.aspx");
                break;
            case 1:
                Response.Redirect("Funcionario/PaginaPrincipal.aspx");
                break;
            default:
                break;
        }

    }
}