using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Relatorios_Porcentagem_de_Atraso : System.Web.UI.Page
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


            PedidoAtrasadoBD bd = new PedidoAtrasadoBD();

            DateTime inicio = Convert.ToDateTime(txtInicio.Text);
            DateTime final = Convert.ToDateTime(txtFinal.Text);

            DataSet pedidoAtrasadobd = bd.SelectData(inicio, final);
            esconderdiv.Visible = false;
            impressorinha.Visible = true;
            titulo.Visible = true;
            periodoinicial.Text = "Relatório de atrasos no período de " + txtInicio.Text;
            periodofinal.Text = " até " + txtFinal.Text;
            //vincula dados ao componente GridView    
            gvPedidosAtrasados.DataSource = pedidoAtrasadobd.Tables[0].DefaultView;
            gvPedidosAtrasados.DataBind();
            CarregaGraficoProduto();
            int rowCount = gvPedidosAtrasados.Rows.Count;
            if (rowCount == 0)
            {
                lblMensagem.Text = "Nenhum Pedido Encontrado Nesse Período";
                lblPorcentagemAtrasos.Text = " ";
                lblTempoMedio.Text = " ";
                lblTotalPedidos.Text = " ";
            }
            else
            {
                //conta as linha do grid
                double totalpedidosatrasados = Convert.ToDouble(gvPedidosAtrasados.Rows.Count.ToString());
                if (totalpedidosatrasados == 1)
                {
                    lblTotalPedidos.Text = "Total de pedidos atrasados: " + Convert.ToString(totalpedidosatrasados) + " Pedido";
                }
                else
                {
                    lblTotalPedidos.Text = "Total de pedidos atrasados: " + Convert.ToString(totalpedidosatrasados) + " Pedidos";
                }

                //Soma os dias da coluna qtd de dias
                double totaldias = Convert.ToDouble(pedidoAtrasadobd.Tables[0].Compute("Sum(pea_qtddias)", "").ToString());

                PedidoBD bd2 = new PedidoBD();
                DataSet pedidobd = bd2.SelectData(inicio, final);
                double totalpedidos = Convert.ToDouble(pedidobd.Tables[0].Rows.Count.ToString());
                lblTotalGeral.Text = "Total de pedidos feitos no período: " + totalpedidos.ToString() + " pedidos.";

                lblPorcentagemAtrasos.Text = "Porcentagem de Atraso: " + ((totalpedidosatrasados / totalpedidos) * 100).ToString("N2") + " %";
                double tempomedio = totaldias / totalpedidosatrasados;
                if (tempomedio == 1)
                {
                    lblTempoMedio.Text = "Tempo Médio de Atraso: " + tempomedio.ToString("N2") + " Dia";
                }
                else
                {
                    lblTempoMedio.Text = "Tempo Médio de Atraso: " + tempomedio.ToString("N2") + " Dias";
                }
            }
        }
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }

    private void CarregaGraficoProduto()
    {

        ItensPedidoBD gridbd = new ItensPedidoBD();
        DataSet ds2 = gridbd.SelectAtraso();

        int qtd = ds2.Tables[0].Rows.Count;

        if (qtd > 0)
        {
            string serie = "";
            foreach (DataRow dr in ds2.Tables[0].Rows)
            {

                serie += @" 

                     {

                    name: '" + dr["pea_status"] + @"',

                    data: [" + dr["M"] + @"," + dr["M1"] + @"," + dr["M2"] + @"," + dr["M3"] + @"," + dr["M4"] + @"," + dr["M5"] + @"," + dr["M6"] + @"," + dr["M7"] + @"," + dr["M8"] + @"," + dr["M9"] + @"," + dr["M10"] + @"," + dr["m11"] + @"]
                    
                },";

            }
            serie = serie.Substring(0, serie.Length - 1);

            lblScriptTen.Text = @"<script>

            Highcharts.chart('containertendencia', {
                chart:
                {
                    type: 'line',
                    height: 283
                },
                title:
                {
                    text: 'Tendências'
                },
                subtitle:
                {
                    text: 'Variação do tempo de atrasos'
                },
                xAxis:
                { categories: [
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
                        text: 'Tempo médio'
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