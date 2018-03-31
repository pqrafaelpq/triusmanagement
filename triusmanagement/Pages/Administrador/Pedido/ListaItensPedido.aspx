<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaItensPedido.aspx.cs" Inherits="Pages_Administrador_Pedido_ListaItensPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Itens de Pedidos"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Produto:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlProduto" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProduto_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ite_produto" HeaderText="Produto" />
                <asp:BoundField DataField="ite_quantidade" HeaderText="Quantidade" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="lbVoltar" runat="server" OnClick="lbVoltar_Click">Voltar</asp:LinkButton>
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
