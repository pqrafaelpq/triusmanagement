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

    <%--HIGHCHARTS, BAIXAR O ARQUIVO  --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title></title>
</head>
<body class="bodypagina raleway">
    <form id="form1" runat="server">

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle texto-branco" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar texto-branco"></span>
                        <span class="icon-bar texto-branco"></span>
                        <span class="icon-bar texto-branco"></span>
                    </button>
                    <a class="navbar-brand" style="padding-top: 10px !important;" href="#">
                        <%--<asp:Label ID="lblmenu" runat="server" Visible="false" Text="LOGO"></asp:Label>--%>
                        <img src="../../Content/triuslogo.png" class="img-responsive" style="max-height: 30px;" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Funcionário
        <span class="caret"></span></a>
                            <ul class="dropdown-menu menuazul">
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" onclick="cadastraFuncionario();">Inserir Novo funcionário</a>
                                </li>
                            </ul>

                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Estoque
        <span class="caret"></span></a>
                            <ul class="dropdown-menu menuazul">

                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="cadastraMateriaPrima();">Cadastrar matéria prima</a>
                                </li>

                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="entradaMateriaPrima();">Registrar compra de matéria prima</a>
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

                                <li><a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="true" onclick="novoPedido();">Registrar novo pedido</a></li>

                                <li>
                                    <asp:LinkButton ID="lbListadePedidos" runat="server" OnClick="lbListadePedidos_Click">Lista de Pedidos</asp:LinkButton>
                                </li>
                            </ul>

                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Produtos<span class="caret"></span></a>
                            <ul class="dropdown-menu menuazul">
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="cadastraProduto();">Cadastrar novo produto</a>
                                </li>
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="listaProdutos();">Listar todos os produtos</a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Relatórios
        <span class="caret"></span></a>
                            <ul class="dropdown-menu menuazul">

                                <li>
                                    <a href="#" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" onclick="consumoMedio();">Consumo por produto</a>
                                </li>

                                <li>
                                    <a href="Relatorios/FrenquenciaEntregasTempoMedioProcessamento.aspx">Frequência de entrega e tempo de processamento</a>
                                </li>
                                <li>
                                    <a href="Relatorios/Lucro.aspx">Gastos e Lucros</a>
                                </li>
                                <li>
                                    <a href="Relatorios/PorcentagemAtraso.aspx">Atrasos</a>
                                </li>

                                <li>
                                    <a href="Relatorios/TamanhoMedioPedido.aspx">Tamanho médio dos pedidos</a>
                                </li>

                                <li>
                                    <a href="Relatorios/Perdas.aspx">Perdas</a>
                                </li>


                            </ul>
                        </li>

                        <li>
                            <asp:LinkButton ID="lbSair" runat="server" OnClick="lbSair_Click"><span class="glyphicon glyphicon-log-out"> </span>   Sair do sistema</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>




        <asp:Label ID="lblErro" Text="" runat="server"></asp:Label>

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
                        <div class="panel-heading">Receita bruta mensal</div>
                        <div class="panel-body table-responsive sempad">
                            <%--<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table-bordered larguratotal">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            
        </asp:GridView>--%>
                             <%--<asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="table table-condensed nopad">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                             
                            </asp:GridView>--%>

                             <div id="containerbal">
                                <asp:Literal ID="lblScriptbal" runat="server"></asp:Literal>

                            </div>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
                         <div class="panel panel-primary">
                        <div class="panel-heading">Pedidos pendentes</div>
                        <div class="panel-body table-responsive sempad" style="max-height: 185px; overflow: auto;">

                            <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand" AutoGenerateColumns="False" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" CssClass="table table-condensed nopad">


                                <Columns>
                                    <asp:BoundField DataField="ped_guid" HeaderText="Guid" Visible="False" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="ped_nomecliente" HeaderText="Nome Cliente" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="ped_contatocliente" HeaderText="Contato" HeaderStyle-CssClass="text-center" />
                                    <asp:TemplateField HeaderText="Itens do Pedido" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbDetalhe" runat="server" CommandName="detalhes" CommandArgument='<%#Bind("ped_guid")%>' CssClass="btn btn-success btn-sm">Detalhes</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ped_quantidadetotal" Visible="false" HeaderText="Quantidade Total" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="ped_valortotal" Visible="false" HeaderText="Valor Total" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="ped_status" Visible="false" HeaderText="Status" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="ped_dataentrada" Visible="false" HeaderStyle-CssClass="text-center" HeaderText="Data de Entrada" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="ped_dataprevista" HeaderStyle-CssClass="text-center" HeaderText="Data Prevista" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                                </Columns>

                                <AlternatingRowStyle BackColor="#DCDCDC" />

                            </asp:GridView>

                        </div>


                         </div>
                            <br /><br />
                    </div>

                    </div>
                </div>
                <div class="col-md-7">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Vendas de produtos por mês</div>

                        <div class="panel-body table-responsive sempad">
                         

                              <div id="containergr">
                                <asp:Literal ID="lblScript" runat="server"></asp:Literal>

                            </div>
                            <%-- <div id="container"></div>
                            <asp:Literal runat="server" ID="lblScript">  </asp:Literal>--%>
                        </div>
                    </div>

                </div>


            </div>
            <div class="row">

                <div class="col-md-5">



                   



                </div>

            </div>


        </div>
        <!--ATE AQUI-->



        <!--modal func-->
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
                                        <td>
                                            <p class="negrito nopad">Código do Pedido: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCodigo" runat="server"></asp:Label></td>
                                    </tr>


                                    <tr>
                                        <td>
                                            <p class="negrito nopad">Nome do Cliente: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblNomeCliente" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad">Telefone de Contato: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblContatoCliente" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad">Quantidade total: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblQtdTotal" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad ">Valor Total: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblValorTotal" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad ">Status do Pedido: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad">Data de Entrada: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEntrada" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad ">Data Prevista de Entrega: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEntrega" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="negrito nopad">Data de conclusão: </p>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPronto" runat="server"></asp:Label></td>
                                    </tr>
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
                                    <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="bg-primary" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" CssClass="text-center" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />

                                </asp:GridView>
                                <br />
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <script>

            function cadastraFuncionario() {
                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Cadastrar novo funcionário</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Administrador/Funcionario/CadastroFuncionario.aspx"></iframe>');
            }

            function cadastraProduto() {
                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Cadastrar novo produto</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Administrador/Produto/CadastroProduto.aspx"></iframe>');
            }

            function listaProdutos() {
                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Produtos cadastrados</h4></div>');
                $("#content").html('<iframe id="framedomodal" height="525px" width="100%" frameborder="0" src="../Administrador/Produto/ListaProduto.aspx"></iframe>');
            }

            function cadastraMateriaPrima() {

                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Cadastrar nova matéria prima</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Administrador/MateriaPrima/CadastroMateriaPrima.aspx"></iframe>');
            }

            function entradaMateriaPrima() {

                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Registrar compra de matéria prima</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Administrador/MateriaPrima/EntradaMateriaPrima.aspx"></iframe>');

            }

            function saidaMateriaPrima() {

                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Registrar gasto de matéria prima</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Administrador/MateriaPrima/SaidaMateriaPrima.aspx"></iframe>');

            }

            function listarMateriaPrima() {

                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Listar matéria prima</h4></div>');
                $("#content").html('<iframe id="framedomodal" height="525px" width="100%" frameborder="0" src="../Administrador/MateriaPrima/ListarMateriaPrima.aspx"></iframe>');

            }

            function novoPedido() {

                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Incluir novo pedido</h4></div>');
                $("#content").html('<iframe id="framedomodalpedido" height="50vh" width="100%" frameborder="0" src="../Administrador/Pedido/Pedido.aspx"></iframe>');

            }

            function consumoMedio() {

                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Consumo médio por produto</h4></div>');
                $("#content").html('<iframe id="framedomodal" onload="resizeIframe(this)" width="100%" frameborder="0" src="../Administrador/Relatorios/ConsumoMedioProduto.aspx"></iframe>');

            }


            function modaldetalhes() {
                //   alert("Chamou");
                $("#mod-titulo").html('<h4 class="modal-title" id="myModalLabel">Detalhes do pedido</h4></div>');
                $('#modal').modal('show');
                // pronto(' ', ' ');
            }

            function pushMessage(t) {
                var mes = 'Info|Implement independently';
                $.Notify({
                    caption: mes.split("|")[0],
                    content: mes.split("|")[1],
                    type: t
                });
            }

            $(function () {
                $('.sidebar').on('click', 'li', function () {
                    if (!$(this).hasClass('active')) {
                        $('.sidebar li').removeClass('active');
                        $(this).addClass('active');
                    }
                })
            })

            function resizeIframe(obj) {
                obj.style.height = obj.contentWindow.document.body.scrollHeight + 30 + 'px';
            }



        </script>

        <div class="rodape">
            <asp:Label ID="lblTitulo" runat="server" Text="Bem Vindo ao sistema,"></asp:Label>
        </div>

    </form>
</body>
</html>
