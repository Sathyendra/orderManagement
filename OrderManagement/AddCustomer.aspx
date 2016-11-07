<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="OrderManagement.AddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-form">
        <div style="width:100%; text-align:center"><asp:Label ID="lblMessage" runat="server"></asp:Label></div>
    <h1 style="text-align:center; ">Add Customers</h1><br />
    <table style="width: 400px; border: none; margin: 0 auto">
        <tr>
            <td>First Name : </td>
            <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>Last Name : </td>
            <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>Address Line 1: </td>
            <td><asp:TextBox ID="txtAddressLine1" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>Address Line 2 : </td>
            <td><asp:TextBox ID="txtAddressLine2" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>City : </td>
            <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>State : </td>
            <td><asp:TextBox ID="txtState" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>ZIP : </td>
            <td><asp:TextBox ID="txtZip" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td>Mobile : </td>
            <td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td colspa="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:center"><asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click"/></td>
        </tr>
    </table>
        </div>
</asp:Content>
