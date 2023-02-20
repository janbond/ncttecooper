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
                                                      "	�s�Ѱ�II / �k�Z���Y�T�G<font size='3' color='red' >" & NewHeavenCode & "</font ><p>" & _
                                                      "�C�F / ����¥ջX���G <font size='3' color='red' >" & BSCode & "</font ><p>" & _
                                                      "	AION / ���n§�A�G<font size='3' color='red' >" & AIONCode & "</font ><p>" & _
                                                      " <br /> " & _
                                                      " <br /> " & _
                                                      "���Ǹ������]�N�@�ֱH��z�ҵn�O���H�c��<p> " & _
                                                      "�ٽЦܭӤH�H�c���d�߭�I<p> " & _
                                                    "</body>"




            sql = "Update Event_NCSOFT_IRIS2018_Code SET available ='N' where NewHeaven_code = '" & NewHeavenCode & "' and BS_code = '" & BSCode & "' and AION_code = '" & AIONCode & "'"
            obj.ExecuteNonQuery(sql)

            Dim subject As String = "�i�`�Vx�s�Ѱ�II�j���_�I���Ǹ��q��"
            Dim body As String = "<html><head></head><body>�˷R�����a�����z�n�G<P>" & _
                                                     "�P�±z�ѻP����NCSOFT x �`�VTt eSPORTS�@�P�|�쪺<p> " & _
                                                     "�u��ɦ@���A�A�{���~�v���u�W�������<p> " & _
                                                     " <br /> " & _
                                                     "�A����o���C�����_�����Ǹ��p�U�G<p> " & _
                                                      "	�s�Ѱ�II / �k�Z���Y�T�G<font size='3' color='red' >" & NewHeavenCode & "</font ><p>" & _
                                                      "�C�F / ����¥ջX���G <font size='3' color='red' >" & BSCode & "</font ><p>" & _
                                                      "AION / ���n§�A�G<font size='3' color='red' >" & AIONCode & "</font ><p>" & _
                                                       " <br /> " & _
                                                      "�`�N�ƶ��G<p> " & _
                                                      "���_�Ц�<a href='http://tw.ncsoft.com/ '>�x��</a>�I��<p> " & _
                                                      "���_�I�������G2018�~12��31���<p> " & _
                                                      "�I�����_��������D�A�Ь�NCSOFT<a href='https://tw.ncsoft.com/faq/contactUs'>�x��ȪA</a><p> " & _
                                                      "�����ʩҦ��ث~���o�n�D�I���{���Ψ�L�ӫ~<p> " & _
                                                      "�p�J���i�ܩڦ]���A�D����N�O�d�̲רM�w�v�C<p>" & _
                                                       " <br /> " & _
                                                      "�A���P�±z���ѻP�I<p>" & _
                                                       " <br /> " & _
                                                    "NCSOFT & �`�V��ީx�� �q�W</body>"
            Try
                SysUtlity.sendMail2("support@ttesports.com", Email, body, subject)
            Catch ex As Exception
                SysUtlity.sendMail2("support@ttesports.com", "eric.lee@thermaltake.com.tw", body, subject & "- �o�H����")
            End Try
        Else
            litCode.Text = "�Ǹ��w�o�񧹲�!"

        End If

        ' Dim formview As FormView = CType(PreviousPage.FindControl("formview1"), FormView)
        '    Dim name = CType(formview.FindControl("name"), TextBox).Text
        '    Dim ExchangeCode As String = CType(formview.FindControl("ExchangeCode"), TextBox).Text

        '    Dim sql As String = "Select * from Event_comdercombo where ExchangeCode = '" & ExchangeCode & "' and name = '" & name & "' "
        '    Dim obj As New SysDbAccess
        '    Dim dt As DataTable = obj.ExecuteDataTableEvent(sql)
        '    If dt.Rows.Count > 0 Then
        '        litCoinCode.Text = dt.Rows(0).Item("CoinCode").ToString
        '        Dim subject As String = "�i�`�Vx�s�Ѱ�II�j���_�I���Ǹ��q��"
        '        Dim body As String = "<html><head></head><body>�˷R�����O��:  <P>" & _
        '                                                 "���±z�ʶR�`�VTt eSPORTS�q�v���~, �H�U�O�z���s�Ѱ�II���ʧǸ� <p> " & _
        '                                                  "<font size='3' color='red' >" & litCoinCode.Text & "</font ><p>" & _
        '                                                "�Цܬ��ʺ���(<a href='http://lineage2.plaync.com.tw/classic/' target='_blank'>http://lineage2.plaync.com.tw/classic/</a>)�i��Ǹ��I���C<p>" & _
        '                                                "�`�V��ޯ��A���Q�Z�L! �L�����Q</body>"
        '        Try
        '            SysUtlity.sendMail2("support@ttesports.com", dt.Rows(0).Item("Email").ToString, body, subject)
        '        Catch ex As Exception
        '            SysUtlity.sendMail2("support@ttesports.com", "clark.lin@thermaltake.com.tw", body, subject & "- �o�H����")
        '        End Try
        '    Else
        '        litCoinCode.Text = "�d�L�Ǹ�! �нT�{��ƬO�_���T!"
        '    End If

    End Sub


End Class
