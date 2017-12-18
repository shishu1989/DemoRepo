Public Class Snippet
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()

        End If
    End Sub


    Public Sub BindGrid()
        Using product As New ProductDBEntities
            Dim Category = From cat In product.Categories
                           Select cat
            gvCustomers.DataSource = Category.ToList()
            gvCustomers.DataBind()
        End Using
    End Sub
    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim ID As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim gvOrders As GridView = TryCast(e.Row.FindControl("gvOrders"), GridView)
            Using product As New ProductDBEntities
                Dim subcat = From cat In product.Categories
                             Join subcateg In product.SubCategories On cat.CategoryID Equals subcateg.CategoryID Where subcateg.CategoryID = ID
                             Select subcateg
                gvOrders.DataSource = subcat.ToList()
                gvOrders.DataBind()
            End Using

        End If
    End Sub
End Class