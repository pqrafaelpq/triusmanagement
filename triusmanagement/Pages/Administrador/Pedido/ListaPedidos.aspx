<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaPedidos.aspx.cs" Inherits="Pages_Administrador_ListaPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/bootbox.min.js"></script>
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/navbar.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilodomodal.css" rel="stylesheet" />
    <link href="../../../Content/CSS/animate.css" rel="stylesheet" />
    <script src="../../../Scripts/datatables.min.js"></script>
    <script src="../../../Scripts/dataTables.bootstrap.min.js"></script>
    <link href="../../../Content/CSS/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <script src="../../../Scripts/notify.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title></title>
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
                        <li>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbVoltar_Click">Voltar</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="container">

           
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                 <h1 class="grande">Lista de Pedidos</h1>
                    </div>
                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Selecione quais pedidos deseja exibir

                        </div>
                        <div class="panel-body">
                            <asp:RadioButton ID="rbTodos" runat="server" AutoPostBack="True" GroupName="Status" OnCheckedChanged="rbTodos_CheckedChanged" Text=" Todos" Selected="True" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbAguardando" runat="server" AutoPostBack="True" GroupName="Status" OnCheckedChanged="rbAguardando_CheckedChanged" Text=" Aguardando" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbPronto" runat="server" AutoPostBack="True" GroupName="Status" OnCheckedChanged="rbPronto_CheckedChanged" Text=" Pronto" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbCancelado" runat="server" AutoPostBack="True" GroupName="Status" OnCheckedChanged="rbCancelado_CheckedChanged" Text=" Cancelado" />
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            
            <asp:GridView ID="GridView1" runat="server" BorderColor="#999999" BorderStyle="None" BorderWidth="0px" CellPadding="3" CellSpacing="0" GridLines="Vertical"  OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-bordered fundo-tabela table-hover">

                <Columns>
                    <asp:BoundField DataField="ped_guid" HeaderText="Guid" Visible="False" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_nomecliente" HeaderText="Nome Cliente" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_contatocliente" HeaderText="Contato" HeaderStyle-CssClass="text-center"/>
                    <asp:TemplateField HeaderText="Itens do Pedido" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDetalhe" runat="server" CommandName="detalhes" CommandArgument='<%# Bind("ped_guid")%>' CssClass="m-btn sm green nopad">Detalhes</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ped_quantidadetotal" HeaderText="Quantidade Total" HeaderStyle-CssClass="text-center" />
                    <asp:BoundField DataField="ped_valortotal" HeaderText="Valor Total" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_status" HeaderText="Status" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_dataentrada" HeaderStyle-CssClass="text-center" HeaderText="Data de Entrada" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="ped_dataprevista" HeaderStyle-CssClass="text-center" HeaderText="Data Prevista" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                    <asp:TemplateField  HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbAlterarStatus" runat="server" CommandName="Status"
                                CommandArgument='<%# Bind("ped_codigo")%>' CssClass="m-btn sm red nopad">Finalizar</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>

                <HeaderStyle BackColor="#2e8bcc" Font-Bold="True" ForeColor="White" />
                <RowStyle CssClass="text-center"/>

            </asp:GridView>
            <asp:Label ID="lblMensagem" runat="server"></asp:Label>
            <br />




        </div>


        <script type="text/javascript">


            //    $(document).ready(
            function pronto(x,y) {

                var titulo = 'Lista de Pedidos '+x+' - Kifome Salgados';
                var mensagem = y;


                $('[id$=GridView1]').prepend($("<thead></thead>").append($('[id$=GridView1]').find("tr:first"))).DataTable({
                    paging: false,
                    ordering: true,
                    info: false,
                    scrollY: '45vh',
                    scrollCollapse: true,
                    dom: 'Bfrtip',
                    buttons: [
                        { extend: 'copy', text: 'Copiar' },
                        { extend: 'excel', text: 'Excel' },
                        {
                            extend: 'pdf',
                            text: 'PDF',
                            title: titulo,
                            messageTop: mensagem,
                            exportOptions: {
                             columns: [0, 1, 3, 4, 5, 6, 7]
                            }
                            
                        },
                        {
                            extend: 'print',
                            text: 'Imprimir',
                            title: titulo,
                            messageTop: "<br><br><br><h1 class='text-primary'><center>" + mensagem + "</center></h1><h3>=============================================================================<br><br></h3>",
                            exportOptions: {
                                columns: [0, 1, 3, 4, 5, 6, 7]
                            }
                        }
                    ],
                    language: {
                        lengthMenu: "Exibir _MENU_ registros por página",
                        zeroRecords: "Nada encontrado",
                        info: "Exibindo página _PAGE_ de _PAGES_",
                        infoEmpty: "Nada encontrado",
                        infoFiltered: "(filtrado de um total de _MAX_ registros)",
                        search: "Pesquisar:",
                        paginate: {
                            first: "Primeiro",
                            last: "Último",
                            next: "Próximo",
                            previous: "Anterior"
                        } //fim paginate
                    }, //fim language
                    pagingType: "full_numbers",
                    processing: true,
                    responsive: {
                        details: true,
                        columns: [
                            { responsivePriority: 1 },
                            { responsivePriority: 2 },
                            { responsivePriority: 3 },
                            { responsivePriority: 4 },
                            { responsivePriority: 5 },
                            { responsivePriority: 6 }
                        ]
                    }


                }); //fim datatable
            };
            //  }); //fim document ready


            function modalstatus() {
               
                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Finalizar o pedido</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this);" width="100%" frameborder="0" src="../../Administrador/Pedido/AlterarStatus.aspx"></iframe>');
                $('#modal').modal('show');
                pronto(' ',' ');
               
            }

            function modaldet() {
                
                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Detalhes do pedido</h4></div>');
                $('#modal').modal('show');
                pronto(' ',' ');
            }

            function resizeIframe(obj) {
                obj.style.height = obj.contentWindow.document.body.scrollHeight + 25 + 'px';
            }
            


            function erro(msg) {
                var alerta = "<h3 class='text-center text-danger'><span class='glyphicon glyphicon-remove'></span> " + msg + "</h3>";

                var dialog = bootbox.dialog({ message: alerta, size: 'big', closeButton: false });

                setTimeout(function () {

                    dialog.modal('hide');
                }, 3000);
                pronto('Lista de pedidos',' ');
            }

            function PrintElem(elem) {
                Popup($(elem).html());
            }

            function Popup(data) {
                var mywindow = window.open('', 'new div', 'height=400,width=600');
                mywindow.document.write('<html><head><title>Detalhes do pedido</title>');
                
                mywindow.document.write('</head><body >');
                mywindow.document.write('<br><br>=============================================================================')
                mywindow.document.write('<h1><center>Kifome Salgados - Detalhes do pedido<center></h1>')
                mywindow.document.write('=============================================================================<br><br>')
                mywindow.document.write('<center>'+data+'</center>');
                mywindow.document.write('<br><br>=============================================================================')
                mywindow.document.write('<center>Obrigado pela preferência!</center>')
                mywindow.document.write('</body></html>');

                mywindow.print();
                //   mywindow.close();
                location.reload();
                return true;
            }


            window.closeModal = function () {
                $('#modal').modal('hide');
                window.location = "ListaPedidos.aspx";
            };

        </script>

        <style type="text/css">
            input[type="search"] {
                width: 60%;
                height: 34px;
                font-size: 14px;
                line-height: 1.42857;
                color: #555;
                background-color: #FFF;
                background-image: none;
                border: 1px solid #CCC;
                border-radius: 4px;
                box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
                transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            }
        </style>
        <!-- MODAL PARA O STATUS-->
        <div class="modal fade" id="modal"  role="dialog" data-keyboard="true" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog scrollmodaldialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                        <div id="mod-titulo">
                            <h4 class="modal-title" id="myModalLabel">Teste</h4>
                        </div>
                    </div>
                    <div class="modal-body scroll" id="content">
                        <div class="table-responsive container-fluid text-center">

                            <h2>Detalhes do Pedido</h2> 
                             
                            <div id="imprimir">
                            <table style="border: none" class="table table-striped table-condensed">

                             <tr>
                                 <td><p class="negrito nopad">Código do Pedido: </p></td> <td><asp:Label ID="lblCodigo" runat="server"></asp:Label></td>
                             </tr>


                            <tr>
                                <td>
                            <p class="negrito nopad">Nome do Cliente: </p></td><td><asp:Label ID="lblNomeCliente" runat="server"></asp:Label></td>
                            </tr>
                                <tr><td>
                            <p class="negrito nopad">Telefone de Contato: </p></td><td> <asp:Label ID="lblContatoCliente" runat="server"></asp:Label></td>
                                    </tr><tr>
                            <td><p class="negrito nopad">Quantidade total: </p></td><td> <asp:Label ID="lblQtdTotal" runat="server"></asp:Label></td></tr>
                            <tr>
                            <td><p class="negrito nopad ">Valor Total: </p> </td><td><asp:Label ID="lblValorTotal" runat="server"></asp:Label></td></tr>
                            <tr>
                            <td><p class="negrito nopad ">Status do Pedido: </p> </td><td><asp:Label ID="lblStatus" runat="server"></asp:Label></td> </tr>
                                <tr><td>
                            <p class="negrito nopad">Data de Entrada: </p> </td><td><asp:Label ID="lblEntrada" runat="server"></asp:Label></td></tr>
                            <tr>
                            <td><p class="negrito nopad ">Data Prevista de Entrega: </p> </td><td><asp:Label ID="lblEntrega" runat="server"></asp:Label></td></tr>
                                <tr>
                            <td><p class="negrito nopad">Data de conclusão: </p></td><td> <asp:Label ID="lblPronto" runat="server"></asp:Label></td></tr>
                            </table>

                            <asp:Label ID="lblAtrasado" runat="server" CssClass="negrito text-danger"></asp:Label>

                            <h3>Itens deste pedido</h3>
                       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="table table-condensed">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="ite_produto" HeaderText="Produto" HeaderStyle-CssClass="text-center" />
                                <asp:BoundField DataField="ite_quantidade" HeaderText="Quantidade" HeaderStyle-CssClass="text-center" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#2e8bcc" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" CssClass="text-center"/>
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />

                        </asp:GridView>
                            <br />
                            </div></div>
                       
                           <button onclick="PrintElem('#imprimir')" class="m-btn blue sm"><span class="glyphicon glyphicon-print"></span></button>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL PARA O STATUS-->

    </form>
</body>
</html>
