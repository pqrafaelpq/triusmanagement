using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_MateriaPrima_ListarEntrada : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void CarregaGrid()
    {
        EntradaBD bd = new EntradaBD();
        DataSet entrada = null;
        DataSet saida = null;

        DateTime inicio = Convert.ToDateTime(txtInicio.Text);
        DateTime final = Convert.ToDateTime(txtFinal.Text);
        
        //verifica qual radiobutton foi clicado
        if (rbTodos.Checked)
        {            
            entrada = bd.SelectAllEntrada(inicio, final);
            saida = bd.SelectAllSaida(inicio, final);

            //vincula dados da entrada ao componente GridView    
            gvEntradaMateria.DataSource = entrada.Tables[0].DefaultView;
            gvEntradaMateria.DataBind();
            
                        
            //vincula dados da saida ao componente GridView    
            gvSaidaMateria.DataSource = saida.Tables[0].DefaultView;
            gvSaidaMateria.DataBind();

        }
        if (rbEntrada.Checked)
        {

            gvSaidaMateria.DataSource = null;
            gvSaidaMateria.DataBind();

            entrada = bd.SelectAllEntrada(inicio, final);

            //vincula dados da entrada ao componente GridView    
            gvEntradaMateria.DataSource = entrada.Tables[0].DefaultView;
            gvEntradaMateria.DataBind();
           
        }
        if (rbSaida.Checked)
        {
            gvEntradaMateria.DataSource = null;
            gvEntradaMateria.DataBind();

            saida = bd.SelectAllSaida(inicio, final);
            //vincula dados da saida ao componente GridView    
            gvSaidaMateria.DataSource = saida.Tables[0].DefaultView;
            gvSaidaMateria.DataBind();
        }
    }

    protected void rbTodos_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void rbEntrada_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void rbSaida_CheckedChanged(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
    protected void gvEntradaMateria_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}