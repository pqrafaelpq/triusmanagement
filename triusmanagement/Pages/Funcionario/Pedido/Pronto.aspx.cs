using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using kifome.Classes;
using kifome.Persistencia;

public partial class Pages_Administrador_Pedido_Pronto : System.Web.UI.Page
{
    internal DataTable dtb = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            dtb = CriaDataTable();

            Session["mDatatable"] = dtb;

            this.GridView1.DataSource = ((DataTable)Session["mDatatable"]).DefaultView;
            this.GridView1.DataBind();

            PedidoBD bd = new PedidoBD();
            Pedido pedido = bd.SelectGuid(Convert.ToInt32(Session["ID"]));
            lblGuid.Text = pedido.Produto;

            CarregaProduto();
            ddlProduto.Focus();

        }
    }

    private void CarregaProduto()
    {
        string codigo = lblGuid.Text;

        ItensPedidoBD bd = new ItensPedidoBD();
        DataSet ds = bd.SelectAllItens(codigo);

        ddlProduto.DataSource = ds.Tables[0].DefaultView;
        ddlProduto.DataTextField = "ite_produto";
        ddlProduto.DataValueField = "ite_codigo";
        ddlProduto.DataBind();
        ddlProduto.Items.Insert(0, new ListItem("Selecione", "0"));
    }

    private void LimparCampos()
    {

        //remove seleção do ddl
        for (int i = 0; i < ddlProduto.Items.Count; i++)
        {
            ddlProduto.Items[i].Selected = false;
        }
        //coloca o "Selecione" selecionado
        ddlProduto.Items[0].Selected = true;
    }

    private DataTable CriaDataTable()
    {
        DataTable mDataTable = new DataTable();

        DataColumn mDataColumn;

        mDataColumn = new DataColumn();
        mDataColumn.DataType = Type.GetType("System.String");
        mDataColumn.ColumnName = "Produto";
        mDataTable.Columns.Add(mDataColumn);

        mDataColumn = new DataColumn();
        mDataColumn.DataType = Type.GetType("System.Int32");
        mDataColumn.ColumnName = "Quantidade de perdas";
        mDataTable.Columns.Add(mDataColumn);

        mDataColumn = new DataColumn();
        mDataColumn.DataType = Type.GetType("System.String");
        mDataColumn.ColumnName = "Motivo";
        mDataTable.Columns.Add(mDataColumn);

        return mDataTable;
    }

    private void incluirNoDataTable(string produto, int quantidade, string motivo, DataTable dtb)
    {
        DataRow row;

        row = dtb.NewRow();

        row["Produto"] = produto;
        row["Quantidade de perdas"] = quantidade;
        row["Motivo"] = motivo;

        dtb.Rows.Add(row);

        //string qtd = dtb.Compute("Sum(Quantidade)", "").ToString();
        //lblQuantidadeTotal2.Text = qtd;

        //string total = dtb.Compute("Sum(Subtotal)", "").ToString();
        //lblValorTotal2.Text = total;

    }

    protected void btnIncluir_Click1(object sender, EventArgs e)
    {
        if (ddlProduto.Text.Trim() == "Selecione")
        {
            this.lblMensagem.Text = "Informe o produto.";
            return;
        }
        if (txtQuantidade.Text.Trim() == "")
        {
            this.lblMensagem.Text = "Informe a quantidade de perdas.";
            return;
        }
        else
        {
            incluirNoDataTable(ddlProduto.SelectedItem.Text.Trim(), Convert.ToInt32(txtQuantidade.Text.Trim()), txtMotivo.Text,  (DataTable)Session["mDatatable"]);

            this.GridView1.DataSource = ((DataTable)Session["mDatatable"]).DefaultView;
            this.GridView1.DataBind();

            this.txtQuantidade.Text = "";
            this.txtMotivo.Text = "";
            LimparCampos();
        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        string codigo = Convert.ToString(Session["ID"]);
        DataTable data = (DataTable)Session["mDatatable"];
        foreach (DataRow row in data.Rows)
        {
            Perdas perdas = new Perdas();
            perdas.PedCodigo = lblGuid.Text;
            perdas.Produto = row.Field<String>(0);
            perdas.Quantidade = row.Field<int>(1);
            perdas.Motivo = row.Field<String>(2);
            perdas.Data = DateTime.Now;

            PerdasBD bdperdas = new PerdasBD();
            if (bdperdas.Insert(perdas))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);

                GridView1.DataSource = null;
                GridView1.DataBind();
                LimparCampos();

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Ocorreu um erro! Contate o suporte!');", true);
            }
        }
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Primeira Forma
        DataTable table = Session["mDataTable"] as DataTable;
        table.Rows.RemoveAt(e.RowIndex + (GridView1.PageIndex * 10));
        Session["dataTable"] = table;
        GridView1.DataSource = table;
        GridView1.DataBind();
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }
}
