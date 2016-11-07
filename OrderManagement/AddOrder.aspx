<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="OrderManagement.AddOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="registration-form">
        
        <h1 style="text-align: center;">Add Orders</h1>
        <br />
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upAddOrders" runat="server">
            <ContentTemplate>
                <div style="width: 100%; text-align: center">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <table style="width: 400px; border: none; margin: 0 auto">
            <tr>
                <td>Select Product : </td>
                <td>
                    <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged"></asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>Selct Customer : </td>
                <td>
                    <asp:DropDownList ID="ddlCustomer" runat="server"></asp:DropDownList>
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>Enter Quantity : </td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
             <tr>
                <td>Status : </td>
                <td>
                    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>Unit Price : </td>
                <td>
                    <asp:TextBox ID="txtUnitPrice" runat="server" Enabled="false"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="btnSaveOrder" Text="Save" runat="server" OnClick="btnSaveOrder_Click" />
                </td>
            </tr>
        </table>

            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</asp:Content>
