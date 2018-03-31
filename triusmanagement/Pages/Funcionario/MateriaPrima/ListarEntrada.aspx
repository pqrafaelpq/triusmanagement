<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListarEntrada.aspx.cs" Inherits="Pages_Administrador_MateriaPrima_ListarEntrada" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblTitulo" runat="server" Text="Entrada/Saída de Matéria Prima"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Data Inicio"></asp:Label>
        <br />
        <asp:TextBox ID="txtInicio" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Data Final"></asp:Label>
        <br />
        <asp:TextBox ID="txtFinal" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:RadioButton ID="rbTodos" runat="server" AutoPostBack="True" GroupName="materia" OnCheckedChanged="rbTodos_CheckedChanged" Text="Entrada/Saída" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbEntrada" runat="server" AutoPostBack="True" GroupName="materia" OnCheckedChanged="rbEntrada_CheckedChanged" Text="Entrada" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbSaida" runat="server" AutoPostBack="True" GroupName="materia" OnCheckedChanged="rbSaida_CheckedChanged" Text="Saída" />
        <br />
        <asp:GridView ID="gvEntradaMateria" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" OnSelectedIndexChanged="gvEntradaMateria_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ent_nome" HeaderText="Nome" />
                <asp:BoundField DataField="ent_quantidade" HeaderText="Quantidade" />
                <asp:BoundField DataField="ent_descricao" HeaderText="Descrição" />
                <asp:BoundField DataField="ent_valor" HeaderText="Valor" />
                <asp:BoundField DataField="ent_data" HeaderText="Data" />
                <asp:BoundField DataField="ent_funcionario" HeaderText="Funcionario" />
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
        <asp:GridView ID="gvSaidaMateria" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="sai_materia" HeaderText="Nome" />
                <asp:BoundField DataField="sai_quantidade" HeaderText="Quantidade" />
                <asp:BoundField DataField="sai_data" HeaderText="Data" />
                <asp:BoundField DataField="sai_funcionario" HeaderText="Funcionário" />
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
        <br />
        <br />
        <asp:LinkButton ID="lbVoltar" runat="server" OnClick="lbVoltar_Click">Voltar</asp:LinkButton>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
