<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Registration.aspx.vb" Inherits="Registration" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NCSOFT x 曜越科技聯合活動</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        body {
            background-color: #080c0e;
        }

        div#formDiv {
            position: absolute;
            width: 1000px;
            top: 200px;
            left: 50%;
            margin: 0 -500px;
            font-family: '微軟正黑體', Microsoft JhengHei, Verdana, PMingLiU;
        }

        .regtab2 {
            font-size: 18px;
            line-height: 40px;
            /*margin-left: 50px;*/
            font-weight: bold;
            /*margin-left: 100px;*/
            padding-top: 50px;
            color: #000;
        }

        .aa {
            line-height: 24px;
        }


        #FormView1_RequiredFieldValidator1, #RequiredFieldValidator1 {
            color: #FFF;
        }

        .memberPerBoxTab td.ti {
            width: 30%;
            color: #FFF;
            font-size: 18px;
            text-align: center;
            padding: 0;
        }

        .memberPerBoxTab td {
            text-align: left;
            padding: 7px 0;
            font-size: 15px;
        }

        .memberPerBoxTab {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

            .memberPerBoxTab th {
                width: 20%;
                height: 30px;
                text-align: left;
                color: #000;
                font-family: '微軟正黑體', Microsoft JhengHei, Verdana, PMingLiU;
                font-size: 18px;
                font-weight: normal;
            }

            .memberPerBoxTab td {
                color: #FFF;
            }

        .inBox {
            padding: 8px 8px;
            margin: 3px;
            border: 1px solid #dddddd;
            background-color: #FFF;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
        }

        .w80p {
            width: 80%;
        }

        .w50p {
            width: 50%;
        }
    </style>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-19639971-69', 'auto');
        ga('send', 'pageview');

    </script>
</head>



<body>
    <form id="form1" style="text-align: center" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="serNo" DataSourceID="SqlDataSource1"
            DefaultMode="Insert" align="center" Width="100%">
            <InsertItemTemplate>

                <div id="main">
                    <div class="mainpic">
                        <div align="center">
                        </div>
                    </div>
                    <div id="formDiv">
                        <table class="memberPerBoxTab">
                            <tr>
                                <td class="ti">姓名</td>
                                <td>
                                    <asp:TextBox ID="Name" CssClass="inBox w80p" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">性別</td>
                                <td>
                                    <asp:DropDownList ID="Gender" CssClass="inBox w50p" runat="server" SelectedValue='<%# bind("Gender") %>'>
                                        <asp:ListItem Value="">請選擇</asp:ListItem>
                                        <asp:ListItem Value="男">男</asp:ListItem>
                                        <asp:ListItem Value="女">女</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Gender"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">生日</td>
                                <td>
                                    <asp:DropDownList ID="BYear" CssClass="inBox" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem Value="年"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="BYear"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>

                                    <asp:DropDownList ID="BMonth" CssClass="inBox" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem Value="月"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="BMonth"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>

                                    <asp:DropDownList ID="BDay" CssClass="inBox" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem Value="日"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="BDay"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">電話</td>
                                <td>
                                    <asp:TextBox ID="Phone" CssClass="inBox w80p" name="Phone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Phone"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Phone" Display="Dynamic" ForeColor="Gold"
                                        ValidationExpression="^[0-9]*$" runat="server" ErrorMessage="電話號碼格式有誤" ValidationGroup="f1" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">居住地</td>
                                <td>
                                    <asp:DropDownList ID="City" CssClass="inBox" runat="server" AutoPostBack="True" DataSourceID="dscity"
                                        DataTextField="city" DataValueField="city" OnSelectedIndexChanged="City_Selected"
                                        AppendDataBoundItems="True" SelectedValue='<%# bind("City") %>'>
                                        <asp:ListItem>請選擇</asp:ListItem>
                                    </asp:DropDownList>
                                    縣市
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="City" 
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="Area" CssClass="inBox" runat="server" DataSourceID="dsarea" DataTextField="pos"
                                                DataValueField="area">
                                            </asp:DropDownList>
                                            區
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Area"
                                                Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="City" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                    <asp:TextBox ID="Address" CssClass="inBox w80p" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Address"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>



                                </td>
                            </tr>
                            <tr>
                                <td class="ti">E-mail</td>
                                <td>
                                    <asp:TextBox ID="Email" CssClass="inBox w50p" name="Email" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Gold"
                                        ControlToValidate="Email" Display="Dynamic" ErrorMessage="E-mail格式有誤" SetFocusOnError="True"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="f1"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">再次確認 E-mail</td>
                                <td>
                                    <asp:TextBox ID="chkEmail" CssClass="inBox w50p" name="chkEmail" runat="server" Text=''></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="chkEmail"
                                        Display="Dynamic" ErrorMessage="*此欄位必填" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" ForeColor="Gold" runat="server" ControlToCompare="Email" ControlToValidate="chkEmail" Type="String" Operator="Equal" ErrorMessage="Email 資料不一致"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">輸入產品序號 (含英文字母)</td>
                                <td>
                                    <asp:TextBox ID="ProductCode" CssClass="inBox w80p" name="SN" runat="server" Text='<%# Bind("ProductCode")%>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ProductCode"
                                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="ProductCode" Display="Dynamic" ForeColor="red"
                                        ValidationExpression=".{21}" runat="server" ErrorMessage="序號有誤" ValidationGroup="f1" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">輸入發票號碼 (含英文字母)</td>
                                <td>
                                    <asp:TextBox ID="InvoiceCode" CssClass="inBox w80p" name="SN" runat="server" Text='<%# Bind("InvoiceCode")%>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="InvoiceCode"
                                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="ti">購買地點</br></td>
                                <td>
                                    <asp:TextBox ID="BuyPlace" CssClass="inBox w80p" name="SN" runat="server" Text='<%# Bind("BuyPlace")%>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="BuyPlace"
                                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ForeColor="Gold" ValidationGroup="f1">*此欄位必填</asp:RequiredFieldValidator><br />
                                    請詳細寫出店名，例：曜越專賣店西門店、良興市民店等
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>


                <div class="logo12">
                    <div class="btna">
                        <div id="btn1">
                            <asp:LinkButton ID="btnLink" runat="server" ValidationGroup="f1" CommandName="insert"> </asp:LinkButton>
                        </div>
                    </div>

                    <div class="logo">
                        <div class="logoaa">
                            <a href="http://www.ttesports.com.tw/"></a>
                        </div>
                        <%--                        <div class="logob">
                            <a href="http://www.ttesports.com.tw/"></a>
                        </div>--%>
                        <%--                       <div class="logoc">
                            <a href="http://lineage2.plaync.com.tw/classic/"></a>
                        </div>--%>
                        <%--      <div class="logod">
                            <a href="#"></a>
                        </div>--%>
                    </div>
                </div>
            </InsertItemTemplate>
        </asp:FormView>
    </form>


    <asp:SqlDataSource ID="dsarea" runat="server" ConnectionString="<%$ ConnectionStrings:EsportGameConnectionString %>"
        SelectCommand="SELECT distinct  [area], (SUBSTRING(CAST ([zip] AS VARCHAR), 0, 4) + ' ' + [area]) AS POS FROM [Post_address] WHERE ([city] = @city) order by POS">
        <SelectParameters>
            <asp:Parameter Name="city" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dscity" runat="server" ConnectionString="<%$ ConnectionStrings:EsportGameConnectionString %>"
        SelectCommand="SELECT distinct [city] ,SUBSTRING(CAST ([zip] AS VARCHAR), 0, 2) as sort  FROM [Post_address] where not city in ('釣魚台','連江縣','南海島') order by sort"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventConnectionString %>"
        InsertCommand="INSERT INTO Event_NCSOFT_IRIS2018 ([Name], [Gender], [Birthday], [Phone], [Address],[Email], [ProductCode],[InvoiceCode],Setdate,[BuyPlace]) VALUES (@Name, @Gender, @Birthday, @Phone, @Address,@Email,  @ProductCode, @InvoiceCode,@Setdate,@BuyPlace)">

        <%--updateCommand="UPDATE Event_NCSOFT_IRIS2018 SET name = @Name , Gender = @Gender, Birthday=@Birthday, Phone=@Phone, Address=@Address, Email=@Email,  ProductCode=@ProductCode ,InvoiceCode=@InvoiceCode, BuyPlace=@BuyPlace ,Setdate=GETDATE() ">--%>


        <InsertParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Gender" />
            <asp:Parameter Name="Birthday" />
            <asp:Parameter Name="Phone" />
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="ProductCode" />
            <asp:Parameter Name="InvoiceCode" />
            <asp:Parameter Name="BuyPlace" />
            <asp:Parameter DbType="Datetime" Name="Setdate" />

        </InsertParameters>
    </asp:SqlDataSource>

</body>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-19639971-70', 'auto');
    ga('send', 'pageview');

</script>
</html>
