<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pronto.aspx.cs" Inherits="Pages_Administrador_Pedido_Pronto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
     <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
        <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery.mask.js"></script>
    
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap-select.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />
    
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <script src="../../../Scripts/datatables.min.js"></script>
    <script src="../../../Scripts/dataTables.bootstrap.min.js"></script>
    <link href="../../../Content/CSS/datatables.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/dataTables.bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body class="raleway">
    <form id="form1" runat="server">
    <div class="container text-center">
    <asp:ValidationSummary ID="vsPronto" runat="server" ShowMessageBox="True" ShowSummary="False"/>
        
        <h2>Registro de Perdas</h2>
        <br /><br />

        <div class="alert alert-info">
            <strong>Não tem perdas?</strong> Caso seu pedido não tenha perdas, basta fechar a janela!
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg6">
        <asp:Label ID="Label2" runat="server" Text="Produto:" CssClass="negrito"></asp:Label>
       
        <asp:DropDownList ID="ddlProduto" runat="server" CssClass="selectpicker">
        </asp:DropDownList> </div>
         <div class="col-xs-6 col-sm-6 col-md-6 col-lg6">
             <asp:Label ID="Label3" runat="server" Text="Quantidade perdida:" CssClass="negrito"></asp:Label>
        
        <asp:TextBox ID="txtQuantidade" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RangeValidator ID="rvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite apenas numeros." MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
    

         </div>
            </div>
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <br />
                <asp:Button ID="btnIncluir" runat="server" OnClick="btnIncluir_Click1" Text="Incluir" CssClass="m-btn green nopad" />
            </div>
             <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <asp:Label ID="Label4" runat="server" Text="Motivo:" CssClass="negrito"></asp:Label>
      
        <asp:TextBox ID="txtMotivo" runat="server" CssClass="form-control" placeholder="Informe aqui o motivo da perda deste produto."></asp:TextBox>
        </div>
            </div>
        
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-bordered">
            <Columns> 
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDeletar" runat="server" CommandName="Delete"
                            CommandArgument='' CssClass="m-btn red">Excluir</asp:LinkButton>                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="bg-primary" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />
     
        
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
       
        <asp:Label ID="lblGuid" runat="server" Visible="False"></asp:Label>
        
    
    </div>

        <script>

            function sucesso(){
                var notification = alertify.notify('Registrado com sucesso!', 'success', 4, function () { window.parent.closeModal(); });
            }

            function erro(qualerro) {


                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });

            }

    
        </script>


    </form>
</body>
</html>
