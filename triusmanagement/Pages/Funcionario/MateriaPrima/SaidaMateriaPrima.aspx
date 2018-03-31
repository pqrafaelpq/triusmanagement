<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaidaMateriaPrima.aspx.cs" Inherits="Pages_Administrador_MateriaPrima_SaidaMateriaPrima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <div class="container text-center">
    
        <asp:ValidationSummary ID="vsSaida" runat="server" ShowMessageBox="true" ShowSummary="false" />
        <br />
        <asp:Label ID="lblProduto" runat="server" Text="Matéria Prima:" CssClass="negrito" ></asp:Label>
        <br />
        <asp:DropDownList ID="ddlMateria" runat="server" CssClass="selectpicker">
        </asp:DropDownList>
        <asp:CompareValidator ID="cvMateria" runat="server" ControlToValidate="ddlMateria" ErrorMessage="Selecione Matéria Prima." Operator="NotEqual" SetFocusOnError="True" ValueToCompare="0">*</asp:CompareValidator>
        <br /><br />
        <asp:Label ID="lblQuantidade" runat="server" Text="Quantidade:" CssClass="negrito" ></asp:Label>
        <br />
        <asp:TextBox ID="txtQuantidade" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite a Quantidade." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite Apenas números." MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
        
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />

     
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
    
    </div>

        <script>


function sucesso() {

                var notification = alertify.notify('Registrado com sucesso!', 'success', 2, function () { console.log('dismissed'); });
            }

            function erro(qualerro) {

                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });

            }

        </script>

    </form>
</body>
</html>
