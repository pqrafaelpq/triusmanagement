<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaginaPrincipal.aspx.cs" Inherits="Pages_Erro_PaginaPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 123px">
    
        
        <h1>Ocorreu um erro! Retorne à tela inicial</h1>

        <br />
        <h3><asp:LinkButton ID="lbSair" runat="server" OnClick="lbSair_Click">Voltar para tela de login</asp:LinkButton></h3>
    
    </div>
    </form>
</body>
</html>
