<%@ Page Title="" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HealthyTomatoes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Healthy Tomatoes Home </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Login" runat="server">
    <li> <asp:TextBox ID="login_username" runat="server" ></asp:TextBox> </li>
    <li> <asp:TextBox ID="login_password" runat="server" ></asp:TextBox> </li>
    <li> <asp:Button ID="btn_Login" CssClass="button big fit" runat="server" Text="Log In" OnClick="btn_Login_Click" /> <li>
    <li> <p> Don't have an account? </p> </li>
    <li> <asp:Button ID="btn_SignUp" CssClass="button big fit" runat="server" Text="Sign Up" OnClick="btn_SignUp_Click" /> </li>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="cph_Main" runat="server">
</asp:Content>
