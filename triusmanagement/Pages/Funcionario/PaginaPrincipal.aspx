<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaginaPrincipal.aspx.cs" Inherits="Pages_Administrador_PaginaPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script src="../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/bootbox.min.js"></script>
    <link href="../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../Content/CSS/navbar.css" rel="stylesheet" />
    <link href="../../Content/CSS/estilodomodal.css" rel="stylesheet" />
    <link href="../../Content/CSS/animate.css" rel="stylesheet" />
    <link href="../../Content/CSS/loader.css" rel="stylesheet" />
    <title></title>
   
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
</head>

<form id="form1" runat="server">

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span>
                    <asp:label id="lblmenu" runat="server" text="Olá!"></asp:label>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                   
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Matéria Prima
        <span class="caret"></span></a>
                        <ul class="dropdown-menu menuazul">

                            <li>
                                <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="cadastraMateriaPrima();">Cadastrar matéria prima</a>
                            </li>
                            
                            <li>
                                <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false"  onclick="entradaMateriaPrima();">Registrar compra de matéria prima</a>
                            </li>
                             <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="saidaMateriaPrima();">Retirar matéria prima</a>
                               </li>
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="listarMateriaPrima();">Listar Matéria prima</a>
                                </li>


                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-backdrop="static" data-keyboard="false" href="#">Pedidos<span class="caret"></span></a>
                        <ul class="dropdown-menu menuazul">
                            
                            <li><a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false"  onclick="novoPedido();">Registrar novo pedido</a></li>

                            <li>
                                <asp:linkbutton id="lbListadePedidos" runat="server" onclick="lbListadePedidos_Click">Lista de Pedidos</asp:linkbutton>
                            </li>
                        </ul>

                    </li>
                    
                    <li>
                        <asp:linkbutton id="lbSair" runat="server" onclick="lbSair_Click"><span class="glyphicon glyphicon-log-out"> </span>   Sair do sistema</asp:linkbutton>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <body class="bodypagina raleway">


        <div class="container">

           
            <h1 class="grande animated fadeInLeft">Kifome Salgados</h1>
            <br />

            <!--  <div class="jumbotron jumbopagina">

                <h1 class="grande text-center">Olá! Bem-vindo!</h1>
                <h2 class="text-center">Acesse suas opções no menu acima. Em breve, novidades nesta seção.</h2>

            </div> -->

            <div class="row">

                <div class="col-md-5">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Unidades vendidas por produto</div>
                        <div class="panel-body table-responsive sempad">
                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table-bordered larguratotal">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <%--<FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />--%>
            <%--<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />--%>
        </asp:GridView></div>
                    </div>
                </div>
                <div class="col-md-7">
                   <div class="panel panel-primary">
                        <div class="panel-heading">Valor das vendas por mês</div>

                        <div class="panel-body table-responsive sempad">
                       <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="table table-condensed nopad">
            <AlternatingRowStyle BackColor="#DCDCDC" />
           <%-- <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />--%>
            <%--<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />--%>
        </asp:GridView>
                            <%-- <div id="container"></div>
                            <asp:Literal runat="server" ID="lblScript">  </asp:Literal>--%>
                    </div>
                </div>
                    
                </div>


            </div>
            <div class="row">

                <div class="col-md-5">

                    

                     <div class="panel panel-primary">
                        <div class="panel-heading">Pedidos pendentes</div>
                        <div class="panel-body table-responsive sempad" style="max-height: 165px;overflow: auto;">

      <asp:GridView ID="GridView3"  OnRowCommand="GridView3_RowCommand" AutoGenerateColumns="False" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" CssClass="table table-condensed nopad">
          

                    <Columns>
                    <asp:BoundField DataField="ped_guid" HeaderText="Guid" Visible="False" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_nomecliente" HeaderText="Nome Cliente" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_contatocliente" HeaderText="Contato" HeaderStyle-CssClass="text-center"/>
                    <asp:TemplateField HeaderText="Itens do Pedido" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDetalhe" runat="server" CommandName="detalhes" CommandArgument='<%#Bind("ped_guid")%>' CssClass="btn btn-success btn-sm">Detalhes</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ped_quantidadetotal" Visible="false" HeaderText="Quantidade Total" HeaderStyle-CssClass="text-center" />
                    <asp:BoundField DataField="ped_valortotal" Visible="false" HeaderText="Valor Total" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_status" Visible="false" HeaderText="Status" HeaderStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="ped_dataentrada" Visible="false" HeaderStyle-CssClass="text-center" HeaderText="Data de Entrada" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="ped_dataprevista" HeaderStyle-CssClass="text-center" HeaderText="Data Prevista" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                    </Columns>

                                  <AlternatingRowStyle BackColor="#DCDCDC" />
         
        </asp:GridView>

                        </div>
                    </div>



                </div>

            </div>





        </div>

          <div class="rodape">
            <asp:Label ID="lblTitulo" runat="server" Text="Bem Vindo ao sistema,"></asp:Label>
        </div>
         <div class="modal fade" id="modal" tabindex="-1" role="dialog" data-keyboard="true" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
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
                            <table style="border: none" class="table table-striped">

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
                       <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" CssClass="table table-condensed">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="ite_produto" HeaderText="Produto" HeaderStyle-CssClass="text-center" />
                                <asp:BoundField DataField="ite_quantidade" HeaderText="Quantidade" HeaderStyle-CssClass="text-center" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle  Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="bg-primary" />
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


                    </div>
                </div>
            </div>
        </div>


    </body>


    

    <script>

     

        function cadastraMateriaPrima() {

            $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Cadastrar nova matéria prima</h4></div>');
            $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Funcionario/MateriaPrima/CadastroMateriaPrima.aspx"></iframe>');
        }

        function entradaMateriaPrima() {

            $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Registrar compra de matéria prima</h4></div>');
            $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Funcionario/MateriaPrima/EntradaMateriaPrima.aspx"></iframe>');

        }

        function novoPedido() {

            $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Incluir novo pedido</h4></div>');
            $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Funcionario/Pedido/Pedido.aspx"></iframe>');

        }



        function saidaMateriaPrima() {

            $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Registrar gasto de matéria prima</h4></div>');
            $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Funcionario/MateriaPrima/SaidaMateriaPrima.aspx"></iframe>');

        }

        function listarMateriaPrima() {

            $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Listar matéria prima</h4></div>');
            $("#content").html('<iframe id="framedomodal" height="525px" width="100%" frameborder="0" src="../Funcionario/MateriaPrima/ListarMateriaPrima.aspx"></iframe>');

        }



        function resizeIframe(obj) {
            obj.style.height = obj.contentWindow.document.body.scrollHeight + 30 + 'px';
        }

    </script>

  

</form>

</html>
