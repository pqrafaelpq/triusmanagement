<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pedido.aspx.cs" Inherits="Pages_Administrador_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
     <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
        <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery.mask.js"></script>
    <script src="../../../Scripts/notify.js"></script>
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-select.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../../../Scripts/bootstrap-datepicker.pt-BR.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <script src="../../../Scripts/datatables.min.js"></script>
    <script src="../../../Scripts/dataTables.bootstrap.min.js"></script>
    <link href="../../../Content/CSS/datatables.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/dataTables.bootstrap.min.css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body class="raleway">
    <form id="form1" runat="server">

       


    <div class="container-fluid">
    
        <asp:ValidationSummary ID="vsPedido" runat="server" ShowMessageBox="True" ShowSummary="False"/>
        
        
        
     <!--   <asp:Label ID="lblNomeCliente" runat="server" Text="Nome do Cliente" ></asp:Label>-->
       <label for="txtNomeCliente" class="control-label">Nome do Cliente</label>
          
        <asp:TextBox ID="txtNomeCliente" runat="server" placeholder="Nome do Cliente" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNomeCliente" runat="server" ControlToValidate="txtNomeCliente" ErrorMessage="Digite o nome do cliente." SetFocusOnError="True">*</asp:RequiredFieldValidator>
     
                 <br />
       <!-- <asp:Label ID="lblTelCliente" runat="server" Text="Telefone do Cliente"></asp:Label>-->
      
       <label for="txtTel" class="control-label">Contato do Cliente</label>
           
            <asp:TextBox ID="txtTel" runat="server" placeholder="Telefone ou endereço do Cliente" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvContatoCliente" runat="server" ControlToValidate="txtTel" ErrorMessage="Digite o contato do cliente." SetFocusOnError="True">*</asp:RequiredFieldValidator>
       
        <br />

         <div class="panel panel-default">
             <div class="panel-body">
        
        <asp:Label ID="lblProduto" runat="server" Text="Produto:"></asp:Label>
        <asp:DropDownList ID="ddlProduto" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProduto_SelectedIndexChanged1" CssClass="selectpicker" data-live-search-style="begins"
                        data-live-search="true">
            <asp:ListItem>Selecione</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
     <div class="row">
        
         <div class="col-xs-3">
        <asp:Label ID="Label3" runat="server" Text="Valor do cento: R$ " CssClass="control-label"></asp:Label><asp:Label ID="lblValor" runat="server"></asp:Label>
      <br /><br>
        </div><div class="col-xs-3">
        <asp:TextBox ID="txtQuantidade" runat="server" width="100px" placeholder="Quantidade desejada" CssClass="form-control"></asp:TextBox></div>
         </div><div class="row">
             <div class="col-xs-3"></div>
         <div class="col-xs-6">
        <asp:Button ID="btnIncluir" runat="server" OnClick="btnIncluir_Click" Text="Incluir" CssClass="m-btn green-stripe nopad"/>
            
        <asp:RangeValidator ID="rvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite apenas numeros." MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
 </div> </div></div></div>

        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting1" CssClass="table table-bordered fundo-tabela table-hover">
            <Columns> 
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDeletar" runat="server" CssClass="btn btn-danger" CommandName="Delete"
                            CommandArgument=''>Excluir</asp:LinkButton>                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#336699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
      
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:Label ID="lblQuantidadeTotal" runat="server" Text="Quantidade Total: " CssClass="negrito"></asp:Label>
                        &nbsp;<asp:Label ID="lblQuantidadeTotal2" runat="server" Text="0"></asp:Label><br />
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:Label ID="lblValorTotal" runat="server" Text=" Valor Total: R$ " CssClass="negrito"></asp:Label>
                        <asp:Label ID="lblValorTotal2" runat="server" Text="0"></asp:Label>
                    </div>
                    <br />
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6  centralizado">
                        <asp:Label ID="lblDataEntrada" runat="server" Text="Data Entrada: " CssClass="negrito"></asp:Label>
                        &nbsp;<asp:Label ID="lblData" runat="server"></asp:Label>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <asp:TextBox ID="txtDataPrevista" runat="server" placeholder="Data prevista de entrega" Width="100%" CssClass="form-control"></asp:TextBox>
                    </div>
                    <br />
                </div>
            </div>
        </div>
     
    
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar Pedido" CssClass="m-btn blue no-pad mar6"/>
  
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        
        
        <asp:Label ID="lblMensagem2" runat="server"></asp:Label>
        <br />
    
    </div>


        <script>

            function sucesso() {

                var notification = alertify.notify('Cadastrado com sucesso', 'success', 2, function () { console.log('dismissed'); });
            }

            function erro(qualerro) {

                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });
                
            }

            $(document).ready(function () {
               $("#<%= txtDataPrevista.ClientID%>").mask('99/99/9999', { reverse: true });
              

            var SPMaskBehavior = function (val) { //cria configuracoes de mascara para o telefone
                return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
            },
                spOptions = {
                    onKeyPress: function (val, e, field, options) {
                        field.mask(SPMaskBehavior.apply({}, arguments), options);
                    }
                };

            $("#<%= txtTel.ClientID%>").mask(SPMaskBehavior, spOptions); //aplica a mascara no telefone com as configuracoes acima

            var dp = $("#<%=txtDataPrevista.ClientID%>");
            dp.datepicker({
                format: "dd/mm/yyyy",
                maxViewMode: 2,
                todayBtn: "linked",
                clearBtn: true,
                language: "pt-BR",
                orientation: "auto right"
            });

            });


            function pronto() {


                $('[id$=GridView1]').prepend($("<thead></thead>").append($('[id$=GridView1]').find("tr:first"))).DataTable({
                    paging: false,
                    ordering: true,
                    info: false,
                    scrollY: '45vh',
                    scrollCollapse: true,
                    dom: 'tip',
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
                            { responsivePriority: 5 },
                            { responsivePriority: 1 },
                            { responsivePriority: 3 },
                            { responsivePriority: 4 },
                            { responsivePriority: 2 }
                            
                        ]
                    }


                }); //fim datatable
            };


            
        </script>


    </form>
</body>
</html>
