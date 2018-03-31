using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using kifome;

public partial class Pages_Administrador_CadastroProduto : System.Web.UI.Page
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
        Produto produto = new Produto();
        produto.Nome = txtNome.Text;
        produto.Quantidade = 0;
        produto.ValorCento = Convert.ToDouble(txtValorCento.Text);
        produto.Descricao = txtDescricao.Text;
        produto.Status = ddlStatus.Text;
        ProdutoBD bd = new ProdutoBD();

        //buscando email do BD
        System.Data.IDbConnection objConexao;
        System.Data.IDbCommand objCommand;
        System.Data.IDataReader objDataReader;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT pro_nome FROM pro_produto ", objConexao);
        objDataReader = objCommand.ExecuteReader();

        //laço repetição
        while (objDataReader.Read())
        {
            //se o campo for igual do BD 
            if (string.Equals(txtNome.Text, objDataReader["pro_nome"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Produto já cadastrado!');", true);
                iscadastrar = true;
                break;
            }
        }

        if (iscadastrar == false)
        {
            if (bd.Insert(produto))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
                txtNome.Text = "";
               // txtQuantidade.Text = "";
                txtValorCento.Text = "";
                txtDescricao.Text = "";
                txtNome.Focus();
                LimparCampos();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Ocorreu um erro. Contate o suporte!');", true);
            }
        }        
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
}