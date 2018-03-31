using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Relatorios_Frenquencia_de_Entregas : System.Web.UI.Page
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
          //  lblTitulo.Text = "Bem-vindo! Você está logado como administrador com o usuário " + funcionario.Nome;
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

            PedidoBD bd = new PedidoBD();

            DateTime inicio = Convert.ToDateTime(txtInicio.Text);
            DateTime final = Convert.ToDateTime(txtFinal.Text);

            DataSet pedidobd = bd.SelectData(inicio, final);

            esconderdiv.Visible = false;
            impressorinha.Visible = true;
            periodoinicial.Text = "Relatório de entregas no período de " + txtInicio.Text;
            periodofinal.Text = " até " + txtFinal.Text;

            //vincula dados ao componente GridView    
            gvPedidos.DataSource = pedidobd.Tables[0].DefaultView;
            gvPedidos.DataBind();
            CarregaGraficoProduto();

            int rowCount = gvPedidos.Rows.Count;
            if (rowCount == 0)
            {
                lblMensagem.Text = "Nenhum Pedido Encontrado Nesse Período";
                lblFrequencia.Text = " ";
                lblTempoMedio.Text = " ";
                lblTotalPedidos.Text = " ";
                lblTotaldeDias.Text = " ";
            }
            else
            {
                //conta as linha do grid
                double totalpedidos = Convert.ToDouble(gvPedidos.Rows.Count.ToString());
                if (totalpedidos == 1)
                {
                    lblTotalPedidos.Text = "Total de pedidos no período: " + Convert.ToString(totalpedidos) + " Pedido";
                }
                else
                {
                    lblTotalPedidos.Text = "Total de pedidos no período: " + Convert.ToString(totalpedidos) + " Pedidos";
                }

                //Soma os dias da coluna qtd de dias
                double totaldias = Convert.ToDouble(pedidobd.Tables[0].Compute("Sum(ped_qtddias)", "").ToString());

                TimeSpan qtddias = final - inicio;
                if (qtddias.Days == 0)
                {
                    lblTotaldeDias.Text = "Quantidade de dias da amostra: " + Convert.ToString(qtddias.Days + 1) + " Dia";
                }
                else
                {
                    lblTotaldeDias.Text = "Quantidade de dias da amostra: " + Convert.ToString(qtddias.Days + 1) + " Dias";
                }

                lblFrequencia.Text = "Frequência de Entrega: " + (totalpedidos / (qtddias.Days + 1)).ToString("N2") + " pedidos por dia.";

                double tempomedio = totaldias / totalpedidos;
                if (tempomedio == 1)
                {

                    lblTempoMedio.Text = "Tempo Médio de Processamento: " + tempomedio.ToString("N2") + " Dia";
                }
                else
                {
                    lblTempoMedio.Text = "Tempo Médio de Processamento: " + tempomedio.ToString("N2") + " Dias";
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
        DataSet ds2 = gridbd.SelecionaTempoMedio();

        int qtd = ds2.Tables[0].Rows.Count;

        if (qtd > 0)
        {
            string serie = "";
            foreach (DataRow dr in ds2.Tables[0].Rows)
            {

                serie += @" 

                     {

                    name: '" + dr["ped_status"] + @"',

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
                    text: 'Variação do tempo de processamento'
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