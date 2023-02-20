Imports System.Data.SqlClient
Imports System.Data

Partial Class Final
    Inherits System.Web.UI.Page
    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim formview As FormView = CType(PreviousPage.FindControl("formview1"), FormView)
        Dim name = CType(formview.FindControl("name"), TextBox).Text
        Dim Email As String = CType(formview.FindControl("Email"), TextBox).Text

        Dim sql As String = "Select TOP 1 NewHeaven_code, BS_code, AION_code from Event_NCSOFT_IRIS2018_Code where available is null"
        Dim obj As New SysDbAccess
        Dim dt As DataTable = obj.ExecuteDataTableEvent(sql)

        If dt.Rows.Count > 0 Then
            'NewHeavenCode.Text = dt.Rows(0).Item("NewHeaven_code").ToString()
            'BSCode.Text = dt.Rows(0).Item("BS_code").ToString()
            'AIONCode.Text = dt.Rows(0).Item("AION_code").ToString()

            Dim NewHeavenCode As String = dt.Rows(0).Item("NewHeaven_code").ToString()
            Dim BSCode As String = dt.Rows(0).Item("BS_code").ToString()
            Dim AIONCode As String = dt.Rows(0).Item("AION_code").ToString()

            litCode.Text = "<html><head></head><body>" & _
                                                      "	新天堂II / 女武神頭箍：<font size='3' color='red' >" & NewHeavenCode & "</font ><p>" & _
                                                      "劍靈 / 紅兒純白蒙面： <font size='3' color='red' >" & BSCode & "</font ><p>" & _
                                                      "	AION / 摩登禮服：<font size='3' color='red' >" & AIONCode & "</font ><p>" & _
                                                      " <br /> " & _
                                                      " <br /> " & _
                                                      "此序號獎項也將一併寄到您所登記的信箱中<p> " & _
                                                      "還請至個人信箱內查詢唷！<p> " & _
                                                    "</body>"




            sql = "Update Event_NCSOFT_IRIS2018_Code SET available ='N' where NewHeaven_code = '" & NewHeavenCode & "' and BS_code = '" & BSCode & "' and AION_code = '" & AIONCode & "'"
            obj.ExecuteNonQuery(sql)

            Dim subject As String = "【曜越x新天堂II】虛寶兌換序號通知"
            Dim body As String = "<html><head></head><body>親愛的玩家粉絲您好：<P>" & _
                                                     "感謝您參與本次NCSOFT x 曜越Tt eSPORTS共同舉辦的<p> " & _
                                                     "「跨界共鬥，再現光芒」的線上抽獎活動<p> " & _
                                                     " <br /> " & _
                                                     "你所獲得的遊戲虛寶獎項序號如下：<p> " & _
                                                      "	新天堂II / 女武神頭箍：<font size='3' color='red' >" & NewHeavenCode & "</font ><p>" & _
                                                      "劍靈 / 紅兒純白蒙面： <font size='3' color='red' >" & BSCode & "</font ><p>" & _
                                                      "AION / 摩登禮服：<font size='3' color='red' >" & AIONCode & "</font ><p>" & _
                                                       " <br /> " & _
                                                      "注意事項：<p> " & _
                                                      "虛寶請至<a href='http://tw.ncsoft.com/ '>官網</a>兌換<p> " & _
                                                      "虛寶兌換期限：2018年12月31日止<p> " & _
                                                      "兌換虛寶有任何問題，請洽NCSOFT<a href='https://tw.ncsoft.com/faq/contactUs'>官方客服</a><p> " & _
                                                      "本活動所有贈品不得要求兌換現金或其他商品<p> " & _
                                                      "如遇不可抗拒因素，主辦單位將保留最終決定權。<p>" & _
                                                       " <br /> " & _
                                                      "再次感謝您的參與！<p>" & _
                                                       " <br /> " & _
                                                    "NCSOFT & 曜越科技官方 敬上</body>"
            Try
                SysUtlity.sendMail2("support@ttesports.com", Email, body, subject)
            Catch ex As Exception
                SysUtlity.sendMail2("support@ttesports.com", "eric.lee@thermaltake.com.tw", body, subject & "- 發信失敗")
            End Try
        Else
            litCode.Text = "序號已發放完畢!"

        End If

        ' Dim formview As FormView = CType(PreviousPage.FindControl("formview1"), FormView)
        '    Dim name = CType(formview.FindControl("name"), TextBox).Text
        '    Dim ExchangeCode As String = CType(formview.FindControl("ExchangeCode"), TextBox).Text

        '    Dim sql As String = "Select * from Event_comdercombo where ExchangeCode = '" & ExchangeCode & "' and name = '" & name & "' "
        '    Dim obj As New SysDbAccess
        '    Dim dt As DataTable = obj.ExecuteDataTableEvent(sql)
        '    If dt.Rows.Count > 0 Then
        '        litCoinCode.Text = dt.Rows(0).Item("CoinCode").ToString
        '        Dim subject As String = "【曜越x新天堂II】虛寶兌換序號通知"
        '        Dim body As String = "<html><head></head><body>親愛的消費者:  <P>" & _
        '                                                 "謝謝您購買曜越Tt eSPORTS電競產品, 以下是您的新天堂II活動序號 <p> " & _
        '                                                  "<font size='3' color='red' >" & litCoinCode.Text & "</font ><p>" & _
        '                                                "請至活動網頁(<a href='http://lineage2.plaync.com.tw/classic/' target='_blank'>http://lineage2.plaync.com.tw/classic/</a>)進行序號兌換。<p>" & _
        '                                                "曜越科技祝你稱霸武林! 無往不利</body>"
        '        Try
        '            SysUtlity.sendMail2("support@ttesports.com", dt.Rows(0).Item("Email").ToString, body, subject)
        '        Catch ex As Exception
        '            SysUtlity.sendMail2("support@ttesports.com", "clark.lin@thermaltake.com.tw", body, subject & "- 發信失敗")
        '        End Try
        '    Else
        '        litCoinCode.Text = "查無序號! 請確認資料是否正確!"
        '    End If

    End Sub


End Class
