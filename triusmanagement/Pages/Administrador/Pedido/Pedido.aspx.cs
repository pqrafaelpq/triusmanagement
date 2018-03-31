using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using kifome.Classes;
using kifome.Persistencia;
using kifome;

public partial class Pages_Administrador_Test : System.Web.UI.Page
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

            CarregaProduto();
            ddlProduto.Focus();
        }

        lblDataEntrada.Text = "Data de Entrada: " + DateTime.Now;
    }

    private void CarregaProduto()
    {
        ProdutoBD bd = new ProdutoBD();
        DataSet ds = bd.SelectAll();
        ddlProduto.DataSource = ds.Tables[0].DefaultView;
        ddlProduto.DataTextField = "pro_nome";
        ddlProduto.DataValueField = "pro_codigo";
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
        mDataColumn.ColumnName = "Quantidade";
        mDataTable.Columns.Add(mDataColumn);

        mDataColumn = new DataColumn();
        mDataColumn.DataType = Type.GetType("System.Double");
        mDataColumn.ColumnName = "Valor Cento";
        mDataTable.Columns.Add(mDataColumn);

        mDataColumn = new DataColumn();
        mDataColumn.DataType = Type.GetType("System.Decimal");
        mDataColumn.ColumnName = "Subtotal";
        mDataTable.Columns.Add(mDataColumn);

        return mDataTable;
    }

    protected void btnIncluir_Click(object sender, EventArgs e)
    {
        if (ddlProduto.Text.Trim() == "Selecione")
        {
            //this.lblMensagem.Text = "Informe o produto.";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe o produto');", true);
            return;
        }
        if (txtQuantidade.Text.Trim() == "")
        {
          //  this.lblMensagem.Text = "Informe a quantidade.";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe a quantidade');", true);
            return;
        }
        else
        {
            incluirNoDataTable(ddlProduto.SelectedItem.Text.Trim(), Convert.ToInt32(txtQuantidade.Text.Trim()), Convert.ToDouble(lblValor.Text), (DataTable)Session["mDatatable"]);

            this.GridView1.DataSource = ((DataTable)Session["mDatatable"]).DefaultView;
            this.GridView1.DataBind();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "pronto();", true);

            this.txtQuantidade.Text = "";
            this.lblMensagem.Text = "";
            LimparCampos();
        }

    }

    private void incluirNoDataTable(string produto, int quantidade, double valorcento, DataTable dtb)
    {
        DataRow row;

        row = dtb.NewRow();

        double subtotal = (quantidade * valorcento) / 100;
        row["Subtotal"] = subtotal;
        row["Produto"] = produto;
        row["Quantidade"] = quantidade;
        row["Valor Cento"] = valorcento;
        dtb.Rows.Add(row);

        string qtd = dtb.Compute("Sum(Quantidade)", "").ToString();
        lblQuantidadeTotal2.Text = qtd;

        string total = dtb.Compute("Sum(Subtotal)", "").ToString();
        lblValorTotal2.Text = total;

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    /*protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int codigo = 0;
        switch (e.CommandName)
        {
            case "Alterar":
                codigo = Convert.ToInt32(e.CommandArgument);
                Session["ID"] = codigo;
                Response.Redirect("Alterar.aspx");
                break;

            case "Deletar":

                DataTable data = (DataTable)Session["mDatatable"];
                
                row.removeAt(GridView1.SelectedIndex);

                dtb = CriaDataTable();
                Session["mDatatable"] = dtb;
                GridView1.DataSource = Session["mDatatable"];
                 GridView1.DataBind();
                
                break;
            default:
                break;
        }

    }*/



    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        if (txtDataPrevista.Text == "")
        {
            //lblMensagem2.Text = "Informe a Data Prevista.";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Informe a data prevista!');", true);
            return;
        }
        else
        {
            string codigo = Guid.NewGuid().ToString();
            DataTable data = (DataTable)Session["mDatatable"];
            foreach (DataRow row in data.Rows)
            {
                ItensPedido itenspedido = new ItensPedido();
                itenspedido.PedCodigo = codigo;
                itenspedido.Produto = row.Field<String>(0);
                itenspedido.Quantidade = row.Field<int>(1);
                itenspedido.Data = DateTime.Now;
                itenspedido.Status = "Aguardando";

                ItensPedidoBD bditens = new ItensPedidoBD();
                if (bditens.Insert(itenspedido))
                {
                    //lblMensagem.Text = "Itens do pedido salvos com sucesso";

                }
                else
                {
                    //lblMensagem.Text = "Erro ao salvar.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Erro ao salvar. Contate o suporte!');", true);
                }
            }

            DateTime dataprevista = (Convert.ToDateTime(txtDataPrevista.Text)).AddHours(23);
          //  dataprevista.AddHours(20);

            Pedido pedido = new Pedido();
            pedido.NomeCliente = txtNomeCliente.Text;
            pedido.ContatoCliente = txtTel.Text;
            pedido.Produto = codigo;
            pedido.QuantidadeTotal = Convert.ToInt32(lblQuantidadeTotal2.Text);
            pedido.ValorTotal = Convert.ToDouble(lblValorTotal2.Text);
            pedido.Status = "Aguardando";
            pedido.DataEntrada = DateTime.Now;
            pedido.DataPrevista = dataprevista;
            pedido.DataPronto = Convert.ToDateTime(null);
            pedido.QtdDias = 0;
            pedido.Cont = 1;

            PedidoBD bd = new PedidoBD();

            if (bd.Insert(pedido))
            {
                //lblMensagem2.Text = "Pedido salvo com sucesso";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucesso();", true);
                txtNomeCliente.Text = "";
                txtTel.Text = "";
                txtDataPrevista.Text = "";
                lblQuantidadeTotal2.Text = "";
                lblValor.Text = "";
                lblValorTotal2.Text = "";



                GridView1.DataSource = null;
                GridView1.DataBind();

                dtb = null;
                dtb = CriaDataTable();

                Session["mDatatable"] = dtb;

                this.GridView1.DataSource = ((DataTable)Session["mDatatable"]).DefaultView;
                this.GridView1.DataBind();




                txtNomeCliente.Focus();
                LimparCampos();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Erro ao salvar. Contate o suporte!');", true);
            }
        }
    }

    protected void lbCancelar_Click(object sender, EventArgs e)
    {

        Response.Redirect("../PaginaPrincipal.aspx");
    }
    protected void ddlProduto_SelectedIndexChanged1(object sender, EventArgs e)
    {

        
        if (ddlProduto.SelectedItem.Text != "Selecione")
        {
            int codigo = Convert.ToInt32(ddlProduto.SelectedItem.Value);
            ProdutoBD bd = new ProdutoBD();
            Produto produto = bd.Select(codigo);

            lblValor.Text = produto.ValorCento.ToString();
            
        }
        else
        {
            //mensagem
            lblValor.Text = "";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "Pronto();", true);
    }

    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        //Primeira Forma
        DataTable table = Session["mDataTable"] as DataTable;
        table.Rows.RemoveAt(e.RowIndex + (GridView1.PageIndex * 10));
        Session["dataTable"] = table;
        GridView1.DataSource = table;
        GridView1.DataBind();

        string qtd = table.Compute("Sum(Quantidade)", "").ToString();
        lblQuantidadeTotal2.Text = qtd;

        string total = table.Compute("Sum(Subtotal)", "").ToString();
        lblValorTotal2.Text = total;
    }

}

