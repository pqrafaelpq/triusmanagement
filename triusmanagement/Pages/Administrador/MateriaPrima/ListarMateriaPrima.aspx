<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListarMateriaPrima.aspx.cs" Inherits="Pages_Administrador_MateriaPrima_ListarMateriaPrima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <title></title>

     <script src="../../../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <link href="../../../Content/CSS/estilo.css" rel="stylesheet" />
    <link href="../../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/m-buttons.min.css" rel="stylesheet" />
    <script src="../../../Scripts/datatables.min.js"></script>
    <script src="../../../Scripts/dataTables.bootstrap.min.js"></script>
    <link href="../../../Content/CSS/datatables.min.css" rel="stylesheet" />
    <link href="../../../Content/CSS/dataTables.bootstrap.min.css" rel="stylesheet" />


</head>
<body class="raleway">
    <form id="form1" runat="server">
    <div class="container-fluid">
    
    
        <asp:GridView ID="gvMateria" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table table-bordered fundo-tabela">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="mat_nome" HeaderText="Nome" />
                <asp:BoundField DataField="mat_quantidade" HeaderText="Quantidade" />
                <asp:BoundField DataField="mat_descricao" HeaderText="Descrição" />
                <asp:BoundField DataField="mat_status" HeaderText="Status" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
             <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="bg-primary" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
    
    </div>

         <script>

            $(document).ready(function () {


                $('[id$=gvMateria]').prepend($("<thead></thead>").append($('[id$=gvMateria]').find("tr:first"))).DataTable({
                    paging: false,
                    ordering: true,
                    info: false,
                    scrollY: '88vh',
                    scrollCollapse: true,
                    dom: 'tip',
                   language: {
                        lengthMenu: "Exibir _MENU_ registros por página",
                        zeroRecords: "Nada encontrado",
                        info: "Exibindo página _PAGE_ de _PAGES_",
                        infoEmpty: "Nada encontrado",
                        infoFiltered: "(filtrado de um total de _MAX_ registros)",
                        search: "Pesquisar:",
                        paginate: {
                            first: "Primeiro",
                            last: "Último",
                            next: "Próximo",
                            previous: "Anterior"
                        } //fim paginate
                    }, //fim language
                    pagingType: "full_numbers",
                    processing: true,
                    responsive: {
                        details: true,
                        columns: [
                            { responsivePriority: 1 },
                            { responsivePriority: 4 },
                            { responsivePriority: 3 },
                            { responsivePriority: 2 },
                            
                            
                        ]
                    }


                }); //fim datatable
            });

        </script>
    </form>
</body>
</html>
