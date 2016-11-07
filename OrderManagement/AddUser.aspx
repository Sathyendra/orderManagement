<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="OrderManagement.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-form">
        <div style="width: 100%; text-align: center">
            
        <h1 style="text-align: center;">Add Users</h1>
        <br />
        <asp:ScriptManager ID="sm" runat="server" ></asp:ScriptManager>
        <asp:UpdatePanel ID="upAddUsers" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblMessage" runat="server"></asp:Label></div>
                <table style="width: 400px; border: none; margin: 0 auto">
            <tr>
                <td>Login Name : </td>
                <td>
                    <asp:TextBox ID="txtLoginName" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>Password : </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>User Type : </td>
                <td>
                    <asp:DropDownList ID="ddlUserType" runat="server">
                        <asp:ListItem Text="Select User Type..." Value="0"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="A"></asp:ListItem>
                        <asp:ListItem Text="User" Value="U"></asp:ListItem>
                    </asp:DropDownList></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="btnSaveUser" Text="Save" runat="server" OnClick="btnSaveUser_Click" /></td>
            </tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
