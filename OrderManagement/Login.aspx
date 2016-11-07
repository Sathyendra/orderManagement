<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OrderManagement.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table border="0" style="width: 25%; margin:0 auto" class="login-box">
        <tr>
            <td colspan="3"><h2 style="color: #333333; text-align: center"><img src="Images/logo.png" /></h2><br /><h3 style="text-align:center">Login Here</h3></td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td>User Id:</td>
            <td><asp:TextBox ID="txtUserId" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="txtPassword" TextMode="password" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3"><asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" /><br /><br />
                <asp:CheckBox ID="chkRemember" runat="server"/> Remember Me  <a href="#" style="float:right">Forgot Password?</a>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3"><asp:Label ID="lblMessage" runat="server"></asp:Label></td>
        </tr>
    </table>
        </center>
</asp:Content>
