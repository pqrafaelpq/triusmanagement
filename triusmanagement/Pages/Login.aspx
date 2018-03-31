<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/bootbox.min.js"></script>
    <link href="../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/CSS/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <link href="../Content/CSS/m-forms.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title></title>
</head>
<body class="bodylogin">
    <div class="container-fluid">
        <form id="form1" runat="server">
            <script>
                $(document).ready(function () {
                    $('[data-toggle="popover"]').popover();
                });
</script>
            
                <div class="col-md-3">1</div>

                <div class="col-md-6 jumbotron jumbologin open-sans">
                    
                    <div class="text-center raleway">
                   <%-- <span class="glyphicon glyphicon-user  text-info grande"> </span>--%>
                        <img src="../Content/trius%20-%20Copia.png" class="img-fluid" style="max-height: 150px;" />
                        <%--<asp:Label ID="lblTitulo" runat="server" Text="Bem-vindo!" CssClass=" text-info grande"></asp:Label><br />--%>
                   <br /> <h4>Insira seus dados para acessar o sistema.</h4>
                    <br /></div>
                                        <!--<asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="texto-branco"></asp:Label>-->
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Insira seu E-mail" data-toggle="popover" data-trigger="hover" data-content="Digite seu e-mail" data-placement="bottom"></asp:TextBox>
                    <br />
                    <!--<asp:Label ID="lblSenha" runat="server" Text="Senha" CssClass="texto-branco"></asp:Label>-->
                    <br />
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control" placeholder="Insira sua senha" data-toggle="popover" data-trigger="hover" data-content="Digite sua senha" data-placement="bottom"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnEntrar" runat="server" OnClick="btnEntrar_Click" Text="Entrar"  CssClass="m-btn green botao-largo" />
                    <br />
                    <asp:Label ID="lblMensagem" runat="server"></asp:Label>
                    <br />
                </div>
                <div class="col-md-3">2</div>
       
    </div>
    <script type="text/javascript">
        function erro(msg) {
            var alerta = "<h3 class='text-center text-danger'><span class='glyphicon glyphicon-remove'></span> " + msg + "</h3>";

            var dialog = bootbox.dialog({ message: alerta, size: 'small', closeButton: false });

            setTimeout(function () {
                
                dialog.modal('hide');
            }, 3000);
            
        }
    </script>
    </form>
    
    
</body>
</html>
