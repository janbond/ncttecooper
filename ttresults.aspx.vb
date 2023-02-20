
Partial Class ttresults
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.GridView1.AllowPaging = False

        If Session("user") <> "Y" Then
            Response.Redirect("login.aspx")

            '清除所有的Session
            'Session.Abandon()
            Session.Clear()
            Response.End()

        End If
    End Sub
End Class
