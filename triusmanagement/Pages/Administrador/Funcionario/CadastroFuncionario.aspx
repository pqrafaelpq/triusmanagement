<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroFuncionario.aspx.cs" Inherits="Pages_Administrador_CadastroFuncionario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/notify.js"></script>
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
    
        <asp:ValidationSummary ID="vsCadastro" runat="server" ShowMessageBox="True" ShowSummary="False" />
        <br />
        <div class="row">
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="txtNome">Nome do Funcionário: </label>
        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Nome"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="Digite o Nome." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="txtEmail">E-mail do funcionário: </label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Digite o E-mail." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </div>
        </div>
        
        <br />
        <div class="row">
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="txtSenha">Senha para acesso: </label>
        <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control" placeholder="Digite sua senha:" type="password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txtSenha" ErrorMessage="Digite a Senha." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="txtConfirme">Confirme sua senha: </label>
        <asp:TextBox ID="txtConfirme" runat="server" CssClass="form-control" placeholder="Confirme sua senha" type="password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvConfirme" runat="server" ControlToValidate="txtConfirme" ErrorMessage="Digite a confirmação de senha." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </div>
        </div>
        
        <br />
        <div class="row">
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="txtSalario">Salário mensal: </label>
        <asp:TextBox ID="txtSalario" runat="server" CssClass="form-control" placeholder="Salário"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSalario" runat="server" ControlToValidate="txtSalario" ErrorMessage="Digite o Salario." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvSalario" runat="server" ControlToValidate="txtSalario" ErrorMessage="Use apenas numeros." MinimumValue="1" SetFocusOnError="True" Type="Double" MaximumValue="9999999">*</asp:RangeValidator>
        
        </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="txtCracha">Código Crachá: </label>
        <asp:TextBox ID="txtCracha" runat="server" CssClass="form-control" placeholder="Crachá"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCracha" runat="server" ControlToValidate="txtCracha" ErrorMessage="Digite o Cracha." SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvCracha" runat="server" ControlToValidate="txtCracha" ErrorMessage="Digite apenas numeros." MinimumValue="1" SetFocusOnError="True" Type="Double" MaximumValue="999999999999">*</asp:RangeValidator>
        <br />
        </div>
        </div>
        <div class="form-group">
         <div class="row">
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="ddlTipo">Tipo: </label>
        <br />
        <asp:DropDownList ID="ddlTipo" runat="server" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" CssClass="form-control">
            <asp:ListItem Selected="True">Selecione</asp:ListItem>
            <asp:ListItem Value="0">Administrador</asp:ListItem>
            <asp:ListItem Value="1">Funcionario</asp:ListItem>
        </asp:DropDownList>
        <asp:CompareValidator ID="cvTipo" runat="server" ControlToValidate="ddlTipo" ErrorMessage="Escolha um Tipo." Operator="NotEqual" SetFocusOnError="True" ValueToCompare="Selecione">*</asp:CompareValidator>
        <br />
            </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <br />
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />
        &nbsp;&nbsp;
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
       </div>
    
    </div></div>

        <script>

            function sucesso() {
                $.notify("Usuário Cadastrado", "success", {position: "top center"});
            }

            function erro(qualerro) {

                $.notify(qualerro, "error");

            }
        </script>


    </form>
</body>
</html>
