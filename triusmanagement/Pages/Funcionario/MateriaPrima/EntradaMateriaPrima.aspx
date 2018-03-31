<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntradaMateriaPrima.aspx.cs" Inherits="Pages_Administrador_EntradaMateriaPrima" %>

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
<body class="open-sans">
    <form id="form1" runat="server">
    <div class="container">
    
        <asp:ValidationSummary ID="vsEntrada" runat="server" ShowSummary="false" ShowMessageBox="true" />
        
          <div class="row">
               <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
        <asp:Label ID="lblNome" runat="server" Text="Matéria Prima:" CssClass="negrito"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlMateria" runat="server"  Width="100%" CssClass="selectpicker form-control">
        </asp:DropDownList>
        <asp:CompareValidator ID="cvNome" runat="server" ControlToValidate="ddlMateria" ErrorMessage="Selecione uma matéria prima." SetFocusOnError="True" ValueToCompare="Selecione" Operator="NotEqual">*</asp:CompareValidator>
       </div></div>
               <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
        <asp:Label ID="lblDescricao" runat="server" Text="Descrição:" CssClass="negrito"></asp:Label>
        
        <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDescricao" runat="server" ControlToValidate="txtDescricao" ErrorMessage="Digite a descrição." SetFocusOnError="True">*</asp:RequiredFieldValidator>
       </div>    </div>

        </div>
            
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
        <asp:Label ID="lblValor" runat="server" Text="Valor: R$" CssClass="negrito"></asp:Label>
      
        <asp:TextBox ID="txtValor" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvValor" runat="server" ControlToValidate="txtValor" ErrorMessage="Digite o valor." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvValor" runat="server" ControlToValidate="txtValor" ErrorMessage="Digite apenas numeros." MaximumValue="99999999999" MinimumValue="1" SetFocusOnError="True" Type="Double">*</asp:RangeValidator>
       </div></div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
        <asp:Label ID="lblQuantidade" runat="server" Text="Quantidade:" CssClass="negrito"></asp:Label>
        
        <asp:TextBox ID="txtQuantidade" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite a quantidade." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvQuantidade" runat="server" ControlToValidate="txtQuantidade" ErrorMessage="Digite apenas numeros." MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
     </div>
        </div></div>
       
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />
       
        
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
      
    </div>

        <script>

            $(document).ready(function () {
                $("#<%= txtValor.ClientID%>").mask('0000,00', { reverse: true });
            });

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
