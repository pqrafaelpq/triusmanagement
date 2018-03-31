using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Relatorios_Perdas : System.Web.UI.Page
{

    private bool IsAdministrador(int tipo)
    {
        bool retorno = false;
        if (tipo == 0)
        {
            retorno = true;
        }
        return retorno;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        impressorinha.Visible = false;

        int codigo = Convert.ToInt32(Session["codigo"]);
        if (codigo == 0)
        {
            Response.Redirect("../Erro/PaginaPrincipal.aspx");
        }

        FuncionarioBD bd = new FuncionarioBD();
        Funcionario funcionario = bd.Select(codigo);

        if (!IsAdministrador(funcionario.Tipo))
        {
            Response.Redirect("../Erro/PaginaPrincipal.aspx");
        }
        else
        {
            //   lblTitulo.Text = "Bem-vindo! Você está logado como administrador com o usuário " + funcionario.Nome;
            //   lblmenu.Text = funcionario.Nome;
        }

    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        if (txtFinal.Text == "" || txtInicio.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Digite datas válidas!');", true);
            return;
        }
        else
        {


            PerdasBD bd = new PerdasBD();

            DateTime inicio = Convert.ToDateTime(txtInicio.Text);
            DateTime final = Convert.ToDateTime(txtFinal.Text);

            DataSet todasasperdas = bd.SelectData(inicio, final);
            esconderdiv.Visible = false;
            impressorinha.Visible = true;
            periodoinicial.Text = "Relatório de perdas no período de " + txtInicio.Text;
            periodofinal.Text = " até " + txtFinal.Text;
            gvPerdas.DataSource = todasasperdas.Tables[0].DefaultView;
            gvPerdas.DataBind();

            PerdasBD ag = new PerdasBD();
            DataSet perdasagrupadas = bd.SelectAgrupado(inicio, final);

            gvPerdasProduto.DataSource = perdasagrupadas.Tables[0].DefaultView;
            gvPerdasProduto.DataBind();



            int rowCount = gvPerdas.Rows.Count;
            if (rowCount == 0)
            {
                lblMensagem.Text = "Nenhuma perda encontrada nesse período";
                lblPorcentagemAtrasos.Text = " ";
                lblTempoMedio.Text = " ";
                lblTotalPedidos.Text = " ";
            }
            double totalperdastotal = Convert.ToDouble(todasasperdas.Tables[0].Compute("sum(per_quantidade)", "").ToString());
            double totalpedidosatrasados = Convert.ToDouble(gvPerdas.Rows.Count.ToString());

            ItensPedidoBD bd2 = new ItensPedidoBD();
            DataSet itensprontos = bd2.SelectPronto(inicio, final);
            double totalitensprontos = Convert.ToDouble(itensprontos.Tables[0].Compute("sum(ite_quantidade)", "").ToString());

            lblPorcentagemAtrasos.Text = "Porcentagem de Perdas: " + ((totalperdastotal / totalitensprontos) * 100).ToString("N2") + " %";


            lblTotalPedidos.Text = "Total de Perdas: " + Convert.ToString(totalperdastotal) + " unidades perdidas";
            lblTotalTotal.Text = "Total de unidades vendidas: " + Convert.ToString(totalitensprontos);
        }
    }
    }