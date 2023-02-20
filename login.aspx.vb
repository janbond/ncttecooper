
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub login1_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles login1.Authenticate
        If Me.login1.UserName = "admin" And Me.login1.Password = "tt12345" Then
            Session("user") = Me.login1.UserName
            Session("user") = "Y"
            Response.Redirect("ttresults.aspx")
        Else
            Session.Clear()

        End If
    End Sub
End Class
