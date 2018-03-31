using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_MateriaPrima_ListarMateriaPrima : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Carrega();
    }

    private void Carrega()
    {
        MateriaPrimaBD bd = new MateriaPrimaBD();
        DataSet ds = bd.SelectAll();
        gvMateria.DataSource = ds.Tables[0].DefaultView;
        gvMateria.DataBind();
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }

}