<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsumoMedioProduto.aspx.cs" Inherits="Pages_Administrador_Relatorios_ConsumoMedioProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/bootbox.min.js"></script>
    <script src="../../../Scripts/jquery.mask.js"></script>
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/navbar.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilodomodal.css" rel="stylesheet" />
    <link href="../../../Content/CSS/animate.css" rel="stylesheet" />
    <script src="../../../Scripts/datatables.min.js"></script>
    <script src="../../../Scripts/dataTables.bootstrap.min.js"></script>
    <link href="../../../Content/CSS/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-select.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../../../Scripts/bootstrap-datepicker.pt-BR.min.js"></script>
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <script src="../../../Scripts/alertify.min.js"></script>
    <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">

    
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>


</head>
<body class="raleway">
    <form id="form1" runat="server">
        <div class="container text-center">


            <div runat="server" id="divdatas">
                <div class="alert alert-info">
                    <asp:Label ID="Label1" runat="server" Text="Insira a data inicial e a data final que deseja consultar." CssClass="negrito"></asp:Label>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-6 col-sm-5 col-md-5 col-lg-5">
                                <asp:Label ID="Label2" runat="server" Text="Início:"></asp:Label>
                                <asp:TextBox ID="txtInicio" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-xs-6 col-sm-5 col-md-5 col-lg-5">
                                <asp:Label ID="Label3" runat="server" Width="100%" Text="Final:"></asp:Label>

                                <asp:TextBox ID="txtFinal" runat="server" CssClass="form-control"></asp:TextBox>
                                <br />
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <br />
                                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" CssClass="m-btn green nopad" />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <asp:Label ID="lblMensagem" runat="server"></asp:Label>
           
             <div style="align-items: center" class="text-center" id="impressorinha" runat="server">
                <button onclick="PrintElem('#imprimir')" class="m-btn blue sm"><span class="glyphicon glyphicon-print"></span></button>
                <br />
                <br />
            </div>
            <div id="imprimir">
          
               <asp:Label ID="periodoinicial" runat="server" CssClass="h3 negrito text-center text-primary"></asp:Label>
            <asp:Label ID="periodofinal" runat="server" CssClass="h3 negrito text-center text-primary"></asp:Label><br />
            <br />
                <asp:GridView ID="gvItensPedido" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table table-bordered">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="ite_produto" HeaderText="Produto" HeaderStyle-CssClass="text-center" />
                    <asp:BoundField DataField="totalquantidade" HeaderText="Quantidade" HeaderStyle-CssClass="text-center" />
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
            

            <div id="container">
                <asp:Literal ID="lblScript" runat="server"></asp:Literal>

            </div>


                <div id="containertendencia">
                    <asp:Literal ID="lblScriptTen" runat="server"></asp:Literal>

                </div>

                </div>

        </div>


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
                mywindow.document.write('<img src="../../../Content/ppnovo.png" onload="window.print()"  style="max-height:80px; float:left;" /><div style="margin-right:80px;"><h1 style="text-align:center; margin-top:0px !important; margin-bottom:0px !important;">Kifome Salgados<br>Relatório de Vendas por Produto</h1></div>')
                mywindow.document.write('=============================================================================<br>')
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
