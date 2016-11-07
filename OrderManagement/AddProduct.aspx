<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OrderManagement.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-form">
        
        <h1 style="text-align: center;">Add Products</h1>
        <br />
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upAddProducts" runat="server">
            <ContentTemplate>
                <div style="width: 100%; text-align: center">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <table style="width: 400px; border: none; margin: 0 auto">
            <tr>
                <td>Product Name : </td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>Description : </td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>Unit Price : </td>
                <td>
                    <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="btnSaveProduct" Text="Save" runat="server" OnClick="btnSaveProduct_Click" />
                </td>
            </tr>
        </table>

            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</asp:Content>
