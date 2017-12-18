Public Class Page1
    Inherits System.Web.UI.Page
#Region "Page load"


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()


        End If
    End Sub
#End Region
#Region "Bind the grd1"
    ' Bind Grid with category table.
    Public Sub BindGrid()
        Using product As New ProductDBEntities
            Dim Category = From cat In product.Categories
                           Select cat
            Dim subcateg = From cat In product.Categories
                           Join subcat In product.SubCategories On cat.CategoryID Equals subcat.CategoryID Where subcat.CategoryID = cat.CategoryID
                           Select {subcat.SubCategoryID, subcat.Name}

            gvParentGrid.DataSource = Category.ToList()
            gvParentGrid.DataBind()
        End Using
    End Sub
    Protected Sub gvParentGrid_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvParentGrid.RowDataBound
    End Sub
#End Region
End Class