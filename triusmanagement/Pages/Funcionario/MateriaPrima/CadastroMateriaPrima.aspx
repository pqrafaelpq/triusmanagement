<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroMateriaPrima.aspx.cs" Inherits="Pages_Administrador_CadastroMateriaPrima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
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
</head>
<body class="raleway">
    <form id="form1" runat="server">
        <div class="container">

            <asp:ValidationSummary ID="vsCadastro" runat="server" ShowSummary="false" ShowMessageBox="false" />

            <div class="form-group">
                <asp:Label ID="lblNome" runat="server" Text="Nome:" CssClass="negrito"></asp:Label>
                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Digite o Nome da Matéria Prima." SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>
            <%--<div class="form-group">
        <asp:Label ID="lblQuantidade" runat="server" Text="Quantidade:" CssClass="negrito"></asp:Label>
        <asp:TextBox ID="txtQuantidade" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite a quantidade." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite apenas numeros." MaximumValue="999999" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
        
        </div>--%>

            <div class="form-group">
                <asp:Label ID="lblDescricao" runat="server" Text="Descrição:" CssClass="negrito"></asp:Label>
                <br />
                <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDescricao" runat="server" ControlToValidate="txtDescricao" ErrorMessage="Digite a descrição" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <br />
            </div>
            <div class="form-group">
                <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="negrito"></asp:Label>
                <br />
                <asp:DropDownList ID="ddlStatus" runat="server" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" CssClass="selectpicker">
                    <asp:ListItem Selected="True">Selecione</asp:ListItem>
                    <asp:ListItem Value="Ativo">Ativo</asp:ListItem>
                    <asp:ListItem Value="Inativo">Inativo</asp:ListItem>
                </asp:DropDownList>
                <asp:CompareValidator ID="cvStatus" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Selecione um status." Operator="NotEqual" SetFocusOnError="True" ValueToCompare="Selecione">*</asp:CompareValidator>
                <br />
            </div>
            <br />
            <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />
            &nbsp;&nbsp;&nbsp;
        
        
            <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        

        </div>


        <script>


            function sucesso() {

                var notification = alertify.notify('Cadastrado com sucesso!', 'success', 2, function () { console.log('dismissed'); });
            }

            function erro(qualerro) {

                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });
                
            }
        </script>
    </form>
</body>
</html>
