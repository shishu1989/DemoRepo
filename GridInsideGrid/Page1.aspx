<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Page1.aspx.vb" Inherits="GridInsideGrid.Page1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Gridview within Gridivew - Nested gridview example in asp.net </title>
    <script lang="javascript" type="text/javascript">
        function divexpandcollapse(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                img.src = "minus.gif";
            } else {
                div.style.display = "none";
                img.src = "plus.gif";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvParentGrid" runat="server" DataKeyNames="CategoryID" Width="300" AutoGenerateColumns="false" OnRowDataBound="gvParentGrid_RowDataBound" GridLines="None" BorderStyle="Solid" BorderWidth="1px" BorderColor="#df5015">
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <RowStyle BackColor="#E1E1E1" />
                <AlternatingRowStyle BackColor="White" />
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <Columns>
                    <asp:TemplateField ItemStyle-Width="20px">
                        <ItemTemplate>
                            <a href="JavaScript:divexpandcollapse('div<%# Eval("CategoryID") %>');">
                                <img id="imgdiv<%# Eval("CategoryID") %>" width="9px" border="0" src="plus.gif" />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CategoryID" HeaderText="Category ID" HeaderStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="Name" HeaderText="Category Name" HeaderStyle-HorizontalAlign="Left" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div id="div<%# Eval("CategoryID") %>" runat="server" style="display: none; position: relative; left: 15px; overflow: auto">
                                        <asp:GridView ID="gvChildGrid" runat="server" DataKeyNames="SubCategoryID" AutoGenerateColumns="false" BorderStyle="Double" BorderColor="#df5015" GridLines="None" Width="250px">
                                            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                            <RowStyle BackColor="#E1E1E1" />
                                            <AlternatingRowStyle BackColor="White" />
                                            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="SubcategoryID" HeaderText="Subcategory ID" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="Name" HeaderText="Subcategory Name" HeaderStyle-HorizontalAlign="Left" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
