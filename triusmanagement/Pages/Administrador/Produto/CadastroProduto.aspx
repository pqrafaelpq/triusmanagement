<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroProduto.aspx.cs" Inherits="Pages_Administrador_CadastroProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
         <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
        <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
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


            <asp:ValidationSummary ID="vsCasdastro" runat="server" ShowSummary="false" ShowMessageBox="true" />

            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <asp:Label ID="lblNome" runat="server" Text="Nome:" CssClass="negrito"></asp:Label>
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Digite o nome." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Descrição:" CssClass="negrito"></asp:Label>
                        <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescricao" runat="server" ControlToValidate="txtDescricao" ErrorMessage="Digite a descrição." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Valor Cento: R$" CssClass="negrito"></asp:Label>
                        <asp:TextBox ID="txtValorCento" runat="server" CssClass="form-control" placeholder="R$ 0000,00"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvValorporCento" runat="server" ControlToValidate="txtValorCento" ErrorMessage="Digite o valor por cento." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvValorCento" runat="server" ControlToValidate="txtValorCento" ErrorMessage="Digite apenas numeros." MaximumValue="9999999" MinimumValue="1" SetFocusOnError="True" Type="Double">*</asp:RangeValidator>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group nopad">

                        <asp:Label ID="Label6" runat="server" Text="Status:" CssClass="negrito"></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="selectpicker form-control">
                            <asp:ListItem>Selecione</asp:ListItem>
                            <asp:ListItem Value="Ativo">Ativo</asp:ListItem>
                            <asp:ListItem Value="Inativo">Inativo</asp:ListItem>
                        </asp:DropDownList>
                        <asp:CompareValidator ID="cvStatus" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Selecione um status." SetFocusOnError="True" ValueToCompare="Selecione" Operator="NotEqual">*</asp:CompareValidator>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo nopad" />

            <asp:Label ID="lblMensagem" runat="server"></asp:Label>
            <br />

        </div>

        <script>

            $(document).ready(function () {
                $("#<%= txtValorCento.ClientID%>").mask('0000,00', { reverse: true });
            });

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
