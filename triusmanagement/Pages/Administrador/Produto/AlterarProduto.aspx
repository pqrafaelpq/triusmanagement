<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AlterarProduto.aspx.cs" Inherits="Pages_Administrador_Produto_AlterarProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
     <script src="../../../Scripts/alertify.min.js"></script>
        <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
        <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery.mask.js"></script>
    <script src="../../../Scripts/bootstrap-select.min.js"></script>
    <link href="../../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
   
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
</head>
<body class="raleway">
    <form id="form1" runat="server">
    <div class="container text-center">
      <br /><br /><br />
        <asp:ValidationSummary ID="vsAlterar" runat="server" ShowSummary="false" ShowMessageBox="false" />
             <asp:Label ID="lblQuantidade" Visible="false" runat="server"></asp:Label>
        <h2>Alterar Produto</h2>

        <table style="border:none" class="table table-striped">
            <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Produto:" CssClass="negrito"></asp:Label></td>
       
      <td>  <asp:Label ID="lblNome" runat="server"></asp:Label></td>
       </tr>
       <tr>
      
        
        <td><asp:Label ID="Label4" runat="server" Text="Valor por Cento: R$" CssClass="negrito"></asp:Label></td>
      
        <td> <asp:TextBox ID="txtValor" runat="server" CssClass="form-control text-center pequeno"></asp:TextBox></td>
        <asp:RequiredFieldValidator ID="rfvValorporCento" runat="server" ControlToValidate="txtValor" ErrorMessage="Digite o valor por cento." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvValorCento" runat="server" ControlToValidate="txtValor" ErrorMessage="Digite apenas numeros." MaximumValue="9999999" MinimumValue="1" SetFocusOnError="True" Type="Double">*</asp:RangeValidator>
         </tr>
            <tr>
       <td><asp:Label ID="Label5" runat="server" Text="Descrição:" CssClass="negrito"></asp:Label></td> 
       
     <td>    <asp:Label ID="lblDescricao" runat="server"></asp:Label></td> 
       </tr>
     
        
            </table>
           <asp:Label ID="Label7" runat="server" Text="Status:"></asp:Label>
        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="selectpicker">
            <asp:ListItem>Selecione</asp:ListItem>
            <asp:ListItem>Ativo</asp:ListItem>
            <asp:ListItem>Inativo</asp:ListItem>
        </asp:DropDownList>
        <asp:CompareValidator ID="cvStatus" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Selecione um status." SetFocusOnError="True" ValueToCompare="Selecione" Operator="NotEqual">*</asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
    
    </div>

        <script>

 function sucesso() {

     var notification = alertify.notify('Alterado com sucesso!', 'success', 3, function () { window.location = "ListaProduto.aspx"; });
            }

            function erro(qualerro) {

                var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });
                
            }
        </script>

    </form>
</body>
</html>
