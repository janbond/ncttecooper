<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ttresults.aspx.vb" Inherits="ttresults" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NCSOFT x 曜越科技聯合活動</title>

</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server"  DataSourceID="SqlDataSource1">  
            <Columns>
                <asp:BoundField HeaderText="姓名" DataField="name" ItemStyle-Width="80"/>
                <asp:BoundField HeaderText="性別" DataField="Gender"  />
                <asp:BoundField HeaderText="生日" DataField="Birthday"  />
                <asp:BoundField HeaderText="電話" DataField="Phone"  ItemStyle-Width="100"/>
                <asp:BoundField HeaderText="Email" DataField="Email"  ItemStyle-Width="250"/>
                <asp:BoundField HeaderText="居住地" DataField="Address"  ItemStyle-Width="400"/>        
                <asp:BoundField HeaderText="產品序號" DataField="ProductCode" ItemStyle-Width="250" />     
                <asp:BoundField HeaderText="發票號碼" DataField="InvoiceCode"  ItemStyle-Width="100"/>     
                <asp:BoundField HeaderText="填寫日期" DataField="Setdate"  />     
                <asp:BoundField HeaderText="購買地點" DataField="BuyPlace" ItemStyle-Width="300" /> 
            </Columns>
        </asp:GridView>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventConnectionString %>" 
     SelectCommand="select  name, Gender, Birthday, Phone, Email, Address, ProductCode, InvoiceCode, Setdate, BuyPlace from Event_NCSOFT_IRIS2018 where not InvoiceCode = '' order by setdate " >
    
    </asp:SqlDataSource>
</body>
</html>
