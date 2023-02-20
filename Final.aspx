<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Final.aspx.vb" Inherits="Final" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>團結！曜越Tt【軍令官】帶您征戰傳說戰役</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        /*div#formDiv {
            position: absolute;
            top: 450px;
            left: 350px;
        }*/
				div#formDiv {
            position: absolute;
						width:800px;
            top: 200px;
						left: 50%;
						margin: 0 -400px;
            font-family: '微軟正黑體', Microsoft JhengHei, Verdana, PMingLiU;
						
						text-align: center;
        }

        .regtab2 {
            font-size: 20px;
            line-height: 40px;
            margin-left: 50px;
            font-weight: bold;
            margin-left: 100px;
            padding-top: 50px;
            color: #FFF;
        }
				.memberPerBoxTab {
					width:100%;
					border-collapse:collapse;
					border-spacing:0;
				}
				.memberPerBoxTab th {
					width:20%;
					height:30px;
					text-align:left;
					color:#000;
					font-family:'微軟正黑體', Microsoft JhengHei, Verdana, PMingLiU;
					font-size:18px;
					font-weight:normal;
				}
				.memberPerBoxTab td {
					color:#FFF;
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

            
    <div id="main">
        <div class="mainpic">
            <div align="center">
                
            </div>
        </div>
        <div id="formDiv">
            <table class="memberPerBoxTab">
                
                <tr>
                <!--<td height="273">&nbsp;</td>-->
                <td>
                  <h1>登入成功！恭喜您獲得以下遊戲虛寶獎項</h1>
                  <h2><asp:Literal ID="litCode" runat="server"></asp:Literal></h2>
                </td>


<%--                <td height="273">&nbsp;</td>
                <td><h1>您的劍靈II序號 :</h1>
                    <h2><asp:Literal ID="BSCode" runat="server"></asp:Literal></h2></td>
                <td height="273">&nbsp;</td>
                <td><h1>您的AION序號 :</h1>
                    <h2><asp:Literal ID="AIONCode" runat="server"></asp:Literal></h2></td>--%>
                </tr>

            </table>
        </div>
    </div>


<div class="logoWrap">
  <div class="logo">
     <div class="logoaa">
     <a href="http://tw.ttesports.com/index.aspx"></a></div>
     <div class="logoi">
      <a href="http://tw.ncsoft.com/"></a>
     </div>
     <!--<div class="logob">
      <a href=""></a>
     </div>-->
     <br>
     <div class="logoe">
      <a href="#"></a>
     </div>
     <div class="logod">
      <a href="#"></a>
     </div>
     
     <div class="logoc">
      <a href="#"></a>
     </div>
     <!--<div class="logof">
      <a href="http://www.sanjing3c.com.tw/catmiddle.php?cat2=DE"></a>
     </div>
     <div class="logok">
      <a href="https://ttbuy.com.tw/index.php"></a>
     </div>-->
     <!--<div class="logog">
      <a href="#"></a>
     </div>
     <div class="logoh">
      <a href="#"></a>
     </div>
     
     <div class="logoj">
      <a href="http://shopping.friday.tw/midindex/index?midId=63535"></a>
     </div>-->
     
  </div>
</div>





</body>
</html>

