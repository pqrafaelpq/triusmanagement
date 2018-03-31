using kifome.Classes;
using kifome.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Administrador_Relatorios_ConsumoMedioProduto : System.Web.UI.Page
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
          //  lblTitulo.Text = "Bem-vindo! Você está logado como administrador com o usuário " + funcionario.Nome;
            //   lblmenu.Text = funcionario.Nome;
        }
        impressorinha.Visible = false;
    }

    protected void btnBuscar_Click(object sender, EventArgs e) //AO CLICAR RNO BOTAO BUSCAR
    {

        if (txtFinal.Text == "" || txtInicio.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erro('Digite datas válidas!');", true);
            return;
        }
        else
        {
            ItensPedidoBD bd = new ItensPedidoBD();
            DateTime inicio = Convert.ToDateTime(txtInicio.Text); //PEGA O CAMPO DE DATA INICIAL 
            DateTime final = Convert.ToDateTime(txtFinal.Text); //PEGA O CAMPO DE DATA FINAL

            DataSet itenspedidobd = bd.SelectData(inicio, final); //PASSA ELES PRA CLASSE 

            //vincula dados ao componente GridView    
            gvItensPedido.DataSource = itenspedidobd.Tables[0].DefaultView; //POE O RESULTADO NO GRIDVIEW
            gvItensPedido.DataBind();
            divdatas.Visible = false;
            impressorinha.Visible = true;
            periodoinicial.Text = "Vendas por produto no período de " + txtInicio.Text;
            periodofinal.Text = " até " + txtFinal.Text;

            CarregaGrafico();
            CarregaGraficoProduto();

            int rowCount = gvItensPedido.Rows.Count;
            if (rowCount == 0)
            {
                lblMensagem.Text = "Nenhum Produto Encontrado Nesse Período";
            }
            else
            {
                

            }
        }
    }

    protected void lbVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../PaginaPrincipal.aspx");
    }

    private void CarregaGrafico()
    {


        ItensPedidoBD qualquer = new ItensPedidoBD();
    
        
        DateTime iniciog = Convert.ToDateTime(txtInicio.Text);
        DateTime finalg = Convert.ToDateTime(txtFinal.Text);

        DataSet bdg = qualquer.SelectData(iniciog, finalg);

        int qtd = bdg.Tables[0].Rows.Count;

        
        
        if (qtd > 0)
        {

            string serie = "";
          

            foreach (DataRow dr in bdg.Tables[0].Rows)
            {

                serie += @" 

                     {

                    name: '" + dr["ite_produto"] + @"',

                    data: [" + dr["totalquantidade"]+ @"]
                    
                },";

            }

            
            


          
            serie = serie.Substring(0, serie.Length - 1);
           // categorias = categorias.Substring(0, categorias.Length - 1);

            lblScript.Text = @"<script>

            Highcharts.chart('container', {
                chart:
                {
                    type: 'column'
                },
                title:
                {
                    text: 'Total por produto'
                },
                subtitle:
                {
                    text: 'Total de unidades vendidas no período'
                },
                xAxis:
                { categories:['Total Geral'],

                    crosshair: true
                },
                yAxis:
                {
                    min: 0,
                    title:
                    {
                        text: 'Unidades vendidas'
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


    private void CarregaGraficoProduto()
    {

        ItensPedidoBD gridbd = new ItensPedidoBD();
        DataSet ds2 = gridbd.SelectGrafico();

        int qtd = ds2.Tables[0].Rows.Count;

        if (qtd > 0)
        {
            string serie = "";
            foreach (DataRow dr in ds2.Tables[0].Rows)
            {

                serie += @" 

                     {

                    name: '" + dr["ite_produto"] + @"',

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
                    text: 'Variação das vendas no ano'
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