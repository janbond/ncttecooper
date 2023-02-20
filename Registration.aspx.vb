Imports System.Data.SqlClient
Imports System.Data

Partial Class Registration
    Inherits System.Web.UI.Page
    Dim award As String
    Dim ContactId As String
    Dim strFolder As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        strFolder = Request.Url.Segments(1).Replace("/", "")

    End Sub


    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        If FormView1.CurrentMode = FormViewMode.Insert Then
            Dim ddly As DropDownList = CType(FormView1.FindControl("BYear"), DropDownList)
            Dim ddlm As DropDownList = CType(FormView1.FindControl("BMonth"), DropDownList)
            Dim ddld As DropDownList = CType(FormView1.FindControl("BDay"), DropDownList)
            For i As Integer = Integer.Parse(Year(Date.Now)) To 1900 Step -1
                ddly.Items.Add(i)
            Next
            For i As Integer = 1 To 12
                ddlm.Items.Add(i)
            Next
            For i As Integer = 1 To 31
                ddld.Items.Add(i)
            Next
            'ddly.Items.Insert(0, New ListItem("年", ""))
            'ddlm.Items.Insert(0, New ListItem("月", ""))
            'ddld.Items.Insert(0, New ListItem("日", ""))
        End If
    End Sub

    'Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand
    '    If e.CommandName = "insert" Then
    '        Dim name As TextBox = CType(FormView1.FindControl("Name"), TextBox)
    '        Dim ddly As DropDownList = CType(FormView1.FindControl("BYear"), DropDownList)
    '        Dim ddlm As DropDownList = CType(FormView1.FindControl("BMonth"), DropDownList)
    '        Dim ddld As DropDownList = CType(FormView1.FindControl("BDay"), DropDownList)
    '        Dim email As TextBox = CType(Me.FormView1.FindControl("Email"), TextBox)

    '        Dim Phone As TextBox = CType(Me.FormView1.FindControl("Phone"), TextBox)
    '        Dim area As DropDownList = CType(FormView1.FindControl("Area"), DropDownList)

    '        Dim birth As String = ddly.SelectedValue & "/" & ddlm.SelectedValue & "/" & ddld.SelectedValue

    '        If Not IsDate(birth) Then
    '            SysUtlity.CientMsgBox("生日有誤,請重新輸入", Me.Page)
    '            Exit Sub
    '        End If

    '        If Not IsNumeric(Phone.Text) Then
    '            SysUtlity.CientMsgBox("手機有誤,請重新輸入", Me.Page)
    '            Exit Sub
    '        End If

    '        If Not SysUtlity.EmailAddressCheck(email.Text) Then
    '            SysUtlity.CientMsgBox("Email有誤,請重新輸入", Me.Page)
    '            Exit Sub
    '        End If
    '    End If
    'End Sub

    Protected Function checkProductCode(ByVal ProductCode As String) As String
        Dim sql As String = "Select * from Event_NCSOFT_IRIS2018 where ProductCode = '" & ProductCode & "' "
        Dim obj As New SysDbAccess
        Dim dt As DataTable = obj.ExecuteDataTableEvent(sql)
        If dt.Rows.Count > 0 Then
            'If dt.Rows(0).Item("name").ToString.Length = 0 Then ' 空值 表示沒用過
            'Return "OK"
            ' Else
            Return "此序號已經被使用過!"
            'End If
        Else
            Return "OK"
        End If
    End Function


    Protected Sub City_Selected()
        Dim city As DropDownList = CType(FormView1.FindControl("City"), DropDownList)
        Dim area As DropDownList = CType(FormView1.FindControl("Area"), DropDownList)
        Me.dsarea.SelectParameters("city").DefaultValue = city.SelectedValue
        Me.dsarea.DataBind()
        area.DataBind()
    End Sub

    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        'SysUtlity.CientMsgBox("資料已填寫完成，祝您幸運中獎！", Me.Page)
        ' Response.Write("<script>alert('資料已填寫完成，祝您幸運中獎！');location.href='index.html';</script>")
        'Response.End()
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Update Completed');", True)
        Server.Transfer("final.aspx")
    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting

        Dim ProductCode As String = CType(FormView1.FindControl("ProductCode"), TextBox).Text
        Dim msg As String = checkProductCode(ProductCode)

        If Not msg = "OK" Then
            e.Cancel = True
            SysUtlity.CientMsgBox(msg, Me.Page)
            Exit Sub
        End If

        e.Command.Parameters("@ProductCode").Value = ProductCode
        Dim ddly As DropDownList = CType(FormView1.FindControl("BYear"), DropDownList)
        Dim ddlm As DropDownList = CType(FormView1.FindControl("BMonth"), DropDownList)
        Dim ddld As DropDownList = CType(FormView1.FindControl("BDay"), DropDownList)
        Dim birth As String = ddly.SelectedValue & "/" & ddlm.SelectedValue & "/" & ddld.SelectedValue
        e.Command.Parameters("@Birthday").Value = birth

        Dim city As DropDownList = CType(FormView1.FindControl("City"), DropDownList)
        Dim area As DropDownList = CType(FormView1.FindControl("Area"), DropDownList)
        Dim address As TextBox = CType(FormView1.FindControl("Address"), TextBox)
        Dim strAddress As String = city.SelectedValue & area.SelectedItem.Text & address.Text
        e.Command.Parameters("@Address").Value = strAddress
        e.Command.Parameters("@Setdate").Value = DateTime.Now

    End Sub

End Class
