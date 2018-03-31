<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cancelado.aspx.cs" Inherits="Pages_Administrador_Pedido_Cancelado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/alertify.min.js"></script>
    <link href="../../../Content/CSS/alertify.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrapalertify.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />

    <title></title>
</head>
<body class="raleway">
    <form id="form1" runat="server">
        <div class="container">

            <h2 class="text-danger">Pedido Cancelado!</h2>
            <br />
            <br />
            <div class="alert alert-danger">
                <strong>Pedido cancelado. </strong>Informe abaixo o motivo do cancelamento do pedido!
            </div><br />
            <asp:Label ID="Label2" runat="server" Text="Motivo do Cancelamento:" CssClass="negrito"></asp:Label>
            &nbsp;<br />
            <asp:TextBox ID="txtMotivo" runat="server" Height="54px" Width="421px" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="m-btn blue botao-largo" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
  <script>

      function sucesso() {
          var notification = alertify.notify('Registrado com sucesso!', 'success', 4, function () { window.parent.closeModal(); });
      }

      function erro(qualerro) {
          var notification = alertify.notify(qualerro, 'error', 2, function () { console.log('dismissed'); });

      }

  </script>


            <asp:Label ID="lblMensagem" runat="server"></asp:Label>

            <asp:Label ID="lblGuid" runat="server" Visible="False"></asp:Label>


        </div>
    </form>
</body>
</html>
