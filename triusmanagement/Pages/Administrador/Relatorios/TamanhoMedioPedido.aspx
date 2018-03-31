<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TamanhoMedioPedido.aspx.cs" Inherits="Pages_Administrador_Relatorios_Tamanho_Medio_Por_Pedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-control" content="no-cache" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/bootbox.min.js"></script>
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/navbar.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilodomodal.css" rel="stylesheet" />
    <link href="../../../Content/CSS/animate.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-select.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../../../Scripts/bootstrap-datepicker.pt-BR.min.js"></script>
    <script src="../../../Scripts/jquery.mask.js"></script>
    <link href="../../../Content/CSS/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <script src="../../../Scripts/datatables.min.js"></script>
    <script src="../../../Scripts/dataTables.bootstrap.min.js"></script>
    <link href="../../../Content/CSS/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <script src="../../../Scripts/notify.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title></title>
      <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
</head>
<body class="bodypagina open-sans">
    <form id="form1" runat="server">

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                   <a class="navbar-brand" style="padding-top: 10px !important;" href="#">
                          <%--<asp:Label ID="lblmenu" runat="server" Visible="false" Text="LOGO"></asp:Label>--%>
                        <img src="../../../Content/triuslogo.png" class="img-responsive" style="max-height:30px;" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">

                           <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Relatórios
        <span class="caret"></span></a>
                            <ul class="dropdown-menu menuazul">


                                <li>
                                    <a href="../Relatorios/FrenquenciaEntregasTempoMedioProcessamento.aspx">Frequência de entrega e tempo de processamento</a>
                                </li>
                                <li>
                                    <a href="../Relatorios/Lucro.aspx">Gastos e Lucros</a>
                                </li>
                                <li>
                                    <a href="../Relatorios/PorcentagemAtraso.aspx">Atrasos</a>
                                </li>

                                <li>
                                    <a href="../Relatorios/TamanhoMedioPedido.aspx">Tamanho médio dos pedidos</a>
                                </li>

                                <li>
                                    <a href="../Relatorios/Perdas.aspx">Perdas</a>
                                </li>
                                                        </ul>
                        </li>

                        <li>
                            <a href="TamanhoMedioPedido.aspx" id="clicar">Recarregar</a>

                        </li>

                        <li>
                            <a href="../PaginaPrincipal.aspx" id="voltar">Voltar</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="container">

            <h1 class="grande">Tamanho médio do pedido</h1>


            <div id="esconderdiv" runat="server">

                <div class="row text-center">
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">

                        <br />
                        <br />
                        <br />
                        <div class="panel panel-primary">
                            <div class="panel-heading">Selecione o período</div>
                            <div class="panel-body">
                                <asp:Label ID="Label4" runat="server" Text="Inicio:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtInicio" runat="server" CssClass="form-control"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="Final:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtFinal" runat="server" CssClass="form-control"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" CssClass="m-btn blue botao-largo" />
                                <br />
                                <asp:Label ID="lblMensagem" runat="server"></asp:Label>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div style="align-items: center" class="text-center" id="impressorinha" runat="server">
                <button onclick="PrintElem('#semtabela')" class="m-btn green sm"><span class="glyphicon glyphicon-stats"></span></button>
                <button onclick="PrintElem('#imprimir')" class="m-btn blue sm"><span class="glyphicon glyphicon-print"></span></button>
                <br />
                <br />
            </div>


            <div id="imprimir" class="text-center">
                

                <div id="titulo" runat="server">
                    <div id="semtabela">
                <asp:Label ID="periodoinicial" runat="server" CssClass="h3 negrito text-center"></asp:Label>
                <asp:Label ID="periodofinal" runat="server" CssClass="h3 negrito text-center"></asp:Label><br />
                <br />
                &nbsp;<asp:Label ID="lblTotalPedidos" runat="server" CssClass="h4 negrito"></asp:Label>

                &nbsp;<asp:Label ID="lblTamanhoMedio" runat="server" CssClass="h4 negrito"></asp:Label>
                <br /><br />
                    <div class="row">


                 <div class="col-md-3"></div>
                        <div class="col-md-6">
                   <div id="containertendencia">
                    <asp:Literal ID="lblScriptTen" runat="server"></asp:Literal>

                </div></div>    </div> </div> <h3 class="negrito text-primary">Pedidos no período</h3></div>
                            </div>
                    
               
            
                   
                
                <div class="table-responsive">


                    <asp:GridView ID="gvPedidos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table table-bordered">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="ped_nomecliente" HeaderText="Nome Cliente" />
                            <asp:BoundField DataField="ped_quantidadetotal" HeaderText="Quantidade Total" />
                            <asp:BoundField DataField="ped_valortotal" HeaderText="Valor Total" />
                            <asp:BoundField DataField="ped_dataentrada" HeaderText="Data" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#2e8bcc" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </div></div>
            </div></div>

            

        
        <script>

            $(document).ready(function () {
                $("#<%= txtInicio.ClientID%>").mask('99/99/9999', { reverse: true });
                $("#<%= txtFinal.ClientID%>").mask('99/99/9999', { reverse: true });


                var dpa = $("#<%=txtInicio.ClientID%>");
                dpa.datepicker({
                    format: "dd/mm/yyyy",
                    maxViewMode: 2,
                    todayBtn: "linked",
                    clearBtn: true,
                    language: "pt-BR",
                    orientation: "auto right"
                });

                var dpb = $("#<%=txtFinal.ClientID%>");
            dpb.datepicker({
                format: "dd/mm/yyyy",
                maxViewMode: 2,
                todayBtn: "linked",
                clearBtn: true,
                language: "pt-BR",
                orientation: "auto right"
            });
                
            });



            //IMPRIME A DIV #IMPRIMIR
            function PrintElem(elem) {
                Popup($(elem).html()); //FUNCAO CHAMADA PELO BOTAO IMPRIMIR
         
            }

            function Popup(data) { //FUNCAO QUE EFETIVAMENTE IMPRIME A DIV

                var currentdate = new Date();
                var datetime = "Emitido em: " + currentdate.getDate() + "/"
                    + (currentdate.getMonth() + 1) + "/"
                    + currentdate.getFullYear() + " @ "
                    + currentdate.getHours() + ":"
                    + currentdate.getMinutes() + ":"
                    + currentdate.getSeconds();



                var mywindow = window.open('', 'new div', 'height=400,width=600');
                mywindow.document.write('<html><head><title>Detalhes</title>');

                mywindow.document.write('</head><body >');
                mywindow.document.write('=============================================================================')
                mywindow.document.write('<img src="../../../Content/ppnovo.png" onload="window.print()"  style="max-height:80px; float:left;" /><div style="margin-right:80px;"><h1 style="text-align:center; margin-top:0px !important; margin-bottom:0px !important;">Kifome Salgados<br>Relatório de tamanho médio do pedido</h1></div>')
                mywindow.document.write('=============================================================================<br><br>')
                mywindow.document.write('<center>' + data + '</center>');
                mywindow.document.write('=============================================================================<br>')
                mywindow.document.write('<center><img src="../../../Content/TRIUSBW.png" class="img-responsive" style="max-height:30px;" /></center>');
                mywindow.document.write('<center>' + datetime + '</center>')
                mywindow.document.write('</body></html>');

                //mywindow.print();
                // mywindow.close();
                //   location.reload();
                //   window.location.href = "FrenquenciaEntregasTempoMedioProcessamento.aspx";
                return true;
            }

            function sucesso() {

                var notification = alertify.notify('Registrado com sucesso!', 'success', 2, function () { console.log('dismissed'); });
            }

            function erro(qualerro) {

                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });

            }


        </script>


    </form>
</body>
</html>
