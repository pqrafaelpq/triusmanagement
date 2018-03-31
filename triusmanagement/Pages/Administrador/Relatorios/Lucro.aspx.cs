using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Relatorios_Lucro : System.Web.UI.Page
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
        titulo.Visible = false;
        tituloa.Visible = false;

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



            DateTime inicio = Convert.ToDateTime(txtInicio.Text);
            DateTime final = Convert.ToDateTime(txtFinal.Text);

            EntradaBD entradabd = new EntradaBD();
            DataSet Entradabd = entradabd.SelectAllEntrada(inicio, final);

            PedidoBD pedidobd = new PedidoBD();
            DataSet PedidosProntosbd = pedidobd.SelectData(inicio, final);
            esconderdiv.Visible = false;
            impressorinha.Visible = true;
            titulo.Visible = true;
            tituloa.Visible = true;
            periodoinicial.Text = "Relatório de movimentação no período de " + txtInicio.Text;
            periodofinal.Text = " até " + txtFinal.Text;
            //vincula dados ao componente GridView EntradaMateria  
            gvEntradaMateria.DataSource = Entradabd.Tables[0].DefaultView;
            gvEntradaMateria.DataBind();

            //vincula dados ao componente GridView Pedidos Prontos
            gvPedidosProntos.DataSource = PedidosProntosbd.Tables[0].DefaultView;
            gvPedidosProntos.DataBind();

            CarregaGraficoBalanco();


            int rowCount = gvEntradaMateria.Rows.Count;
            int rowCount2 = gvPedidosProntos.Rows.Count;
            if (rowCount == 0)
            {
                if (rowCount2 == 0)
                {
                    lblMensagem.Text = "Nenhuma Entrada de Matéria Prima ou Pedido Encontrado Nesse Período.";
                    lblGastos.Text = "";
                    lblLucro.Text = "";
                    lblVendas.Text = "";
                }
                else
                {
                    lblMensagem.Text = "Nenhuma Entrada de Matéria Prima Encontrada Nesse Período.";
                    lblGastos.Text = "Total de Gastos: " + "R$" + 0.ToString("N2");

                    double totalvendas = Convert.ToDouble(PedidosProntosbd.Tables[0].Compute("Sum(ped_valortotal)", "").ToString());
                    lblVendas.Text = "Total de Vendas: " + "R$" + totalvendas.ToString("N2");

                    lblLucro.Text = "Lucro: " + "R$" + (totalvendas - 0).ToString("N2");
                }
            }
            else
            {
                if (rowCount2 == 0)
                {
                    double totalgastos = Convert.ToDouble(Entradabd.Tables[0].Compute("Sum(ent_valor)", "").ToString());
                    lblGastos.Text = "Total de Gastos: " + "R$" + totalgastos.ToString("N2");

                    double totalvendas2 = 0;
                    lblVendas.Text = "Total de Vendas: " + "R$" + totalvendas2.ToString("N2");

                    lblLucro.Text = "Lucro: " + "R$" + (totalvendas2 - totalgastos).ToString("N2");
                }
                else
                {
                    double totalgastos = Convert.ToDouble(Entradabd.Tables[0].Compute("Sum(ent_valor)", "").ToString());
                    lblGastos.Text = "Total de Gastos: " + "R$" + totalgastos.ToString("N2");

                    double totalvendas2 = Convert.ToDouble(PedidosProntosbd.Tables[0].Compute("Sum(ped_valortotal)", "").ToString());
                    lblVendas.Text = "Total de Vendas: " + "R$" + totalvendas2.ToString("N2");

                    lblLucro.Text = "Lucro: " + "R$" + (totalvendas2 - totalgastos).ToString("N2");
                }
            }
        }
    }
    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }

    private void CarregaGraficoBalanco()
    {
        PedidoBD graficobd = new PedidoBD();
        DataSet ds = graficobd.SelectGrafico();
        //GridView2.DataSource = ds.Tables[0].DefaultView;
        //GridView2.DataBind();

        int qtd = ds.Tables[0].Rows.Count;

        if (qtd > 0)
        {
            string serie = "";
            DataRow dr = ds.Tables[0].Rows[0];
            //  {

            serie += @" 

                     {

                     name: 'Lucro bruto',

                    data: [" + dr["M"] + "," + dr["M1"] + "," + dr["M2"] + "," + dr["M3"] + "," + dr["M4"] + "," + dr["M5"] + "," + dr["M6"] + "," + dr["M7"] + "," + dr["M8"] + "," + dr["M9"] + "," + dr["M10"] + "," + dr["M11"] + "]   },";

            // }
            serie = serie.Substring(0, serie.Length - 1);

            lblScriptTen.Text = @"<script>

            Highcharts.chart('containertendencia', {
                chart:
                {
                    type: 'line',
                    height: 235
                },
                title:
                {
                    text: 'Valor das Vendas'
                },
               
                xAxis:
                { 
                categories: [
                 'Jan',
                 'Fev',
                 'Mar',
                 'Abr',
                 'Mai',
                 'Jun',
                 'Jul',
                 'Ago',
                 'Set',
                 'Out',
                 'Nov',
                 'Dez'
                   ],
                    crosshair: true
                },
                yAxis:
                {
                    min: 0,
                    title:
                    {
                        text: 'Quantidade de pedidos'
                    }
                },
                tooltip:
                {
                    headerFormat: '<span style=\""font-size:10px\>{point.key}</span><table>',
                    pointFormat: '<tr><td style=\""color:{series.color};padding:0\>{series.name}: </td>' +
                    '<td style=\""padding:0\><b>{point.y:.1f} mm</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions:
                {
                    column:
                    {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
               
                },
                series: [" + serie + @"]
            });

            </script>";

        }

    }

}