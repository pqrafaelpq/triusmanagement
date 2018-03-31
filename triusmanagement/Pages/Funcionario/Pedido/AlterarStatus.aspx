<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AlterarStatus.aspx.cs" Inherits="Pages_Administrador_Pedido_AlterarStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
   
     
    <title></title>
</head>
<body class="raleway text-center">
    <form id="form1" runat="server">
        <h2>Finalizar o pedido</h2>
    <div class="container">
  <div class=" table-responsive">
        <table style="border: none" class="table table-condensed table-striped">

          <tr>
      <td>  <asp:Label ID="Label2" runat="server" Text="Nome:"></asp:Label></td>
<td><asp:Label ID="lblNomeCliente" runat="server"></asp:Label></td>
        </tr>
          <tr>
      <td><asp:Label ID="Label4" runat="server" Text="Contato:"></asp:Label></td>
<td><asp:Label ID="lblContatoCliente" runat="server"></asp:Label></td>
        </tr>
          <tr>
         <td> <asp:Label ID="Label6" runat="server" Text="Quantidade Total:"></asp:Label></td>
<td><asp:Label ID="lblQuantidadeTotal" runat="server"></asp:Label></td>
     </tr>
          <tr>
        <td><asp:Label ID="Label7" runat="server" Text="Valor Total:"></asp:Label></td>
<td><asp:Label ID="lblValorTotal" runat="server"></asp:Label></td>
        </tr>
          <tr>
          <td><asp:Label ID="Label9" runat="server" Text="Data de Entrada:"></asp:Label></td>
<td><asp:Label ID="lblDataEntrada" runat="server"></asp:Label></td>
      </tr>
          <tr>
        <td><asp:Label ID="Label10" runat="server" Text="Data Prevista:"></asp:Label></td>
<td><asp:Label ID="lblDataPrevista" runat="server"></asp:Label></td>
          </tr>
          </table>
      </div>
        <asp:Label ID="lblAtrasado" runat="server" CssClass="negrito text-danger"></asp:Label><br />
        <asp:GridView ID="gvItensPedido" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table table-bordered">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ite_produto" HeaderText="Produto" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="ite_quantidade" HeaderText="Quantidade" HeaderStyle-CssClass="text-center" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="bg-primary" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" CssClass="text-center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
 
        <asp:Label ID="Label8" runat="server" Text="Status:" CssClass="negrito"></asp:Label>
<asp:DropDownList ID="ddlStatus" runat="server"  CssClass="selectpicker">
            <asp:ListItem>Aguardando</asp:ListItem>
            <asp:ListItem>Pronto</asp:ListItem>
            <asp:ListItem>Cancelado</asp:ListItem>
        </asp:DropDownList>
      <br />

        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn green" />

        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
       
        <asp:Label ID="lblGuid" runat="server" Visible="False"></asp:Label>
    
    </div>
        <script>

         function sucesso() {

               // $.notify("Cadastrado com sucesso!", "success");
             var notification = alertify.notify('Alterado com sucesso!', 'success', 2, function () { console.log('dismissed'); });
            }

            function erro(qualerro) {

                
                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });

            }

        </script>
        <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
        <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
        <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
        <script src="../../../Scripts/notify.js"></script>
        <script src="../../../Scripts/bootbox.min.js"></script>
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/bootstrap-select.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
        <script src="../../../Scripts/notify.js"></script>
    </form>
</body>
</html>
