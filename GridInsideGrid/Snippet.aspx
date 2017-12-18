<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Snippet.aspx.vb" Inherits="GridInsideGrid.Snippet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $("[src*=plus]").live("click", function () {
        $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
        $(this).attr("src", "images/minus.png");
    });
    $("[src*=minus]").live("click", function () {
        $(this).attr("src", "images/plus.png");
        $(this).closest("tr").next().remove();
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gvCustomers" runat="server" AlternatingRowStyle-BackColor="SteelBlue" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound" CssClass="Grid" DataKeyNames="CategoryID" HeaderStyle-BackColor="Yellow" >
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid" AlternatingRowStyle-BackColor="Wheat">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="SubCategoryID" HeaderText="SubCategory ID" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Name" HeaderText="Name" />
                           <%-- <asp:BoundField ItemStyle-Width="100px" DataField="ManufacturedBY" HeaderText="Manufactured BY"/>--%>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField ItemStyle-Width="150px" DataField="CategoryID" HeaderText="Category ID" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Name" HeaderText="Category Name" />
    </Columns>
</asp:GridView>
    </div>
    </form>
</body>
</html>
