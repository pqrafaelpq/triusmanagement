using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kifome.Classes;
using kifome.Persistencia;
using System.Data;

public partial class Pages_Administrador_Relatorios_Tamanho_Medio_Por_Pedido : System.Web.UI.Page
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
            impressorinha.Visible = false;
            titulo.Visible = false;
            esconderdiv.Visible = true;
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
            titulo.Visible = true;
            periodoinicial.Text = "Relatório para o período de " + txtInicio.Text;
            periodofinal.Text = " até " + txtFinal.Text;
            //vincula dados ao componente GridView    
            gvPedidos.DataSource = pedidobd.Tables[0].DefaultView;
            gvPedidos.DataBind();
            CarregaGraficoProduto();

            int rowCount = gvPedidos.Rows.Count;
            if (rowCount == 0)
            {
                lblMensagem.Text = "Nenhum Pedido Encontrado Nesse Período";
                lblTotalPedidos.Text = " ";
                lblTamanhoMedio.Text = " ";
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

                double qtdtotal = Convert.ToDouble(pedidobd.Tables[0].Compute("Sum(ped_quantidadetotal)", "").ToString());

                lblTamanhoMedio.Text = "Tamanho Médio dos pedidos: " + Convert.ToString(qtdtotal / totalpedidos);
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
        DataSet ds2 = gridbd.SelectTamanhoMedio();

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
                    text: 'Variação do tamanho médio dos pedidos'
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