<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="none" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HealthyTomatoes.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Login to Healthy Tomatoes </title>
    <link rel="stylesheet" href="assets/css/login.css" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_Links" runat="server">
    <li><a href="/login.aspx"> Log In </a></li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_Main" runat="server">

        <div class="login">

            <asp:TextBox ID="login_username" placeholder="Username" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="* Username is required!" ForeColor="#CC0000" ControlToValidate="login_username" Display="Dynamic"></asp:RequiredFieldValidator>

            <asp:TextBox ID="login_password" placeholder="Password" style="margin-top: 10px;" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_password" runat="server" ErrorMessage="* Password is required!" ForeColor="#CC0000" ControlToValidate="login_password" Display="Dynamic"></asp:RequiredFieldValidator>

            <asp:Label ID="lbl_error" runat="server" Text="Label" Visible="True" ForeColor="#CC0000"></asp:Label>

            <asp:Button ID="btn_Login" CssClass="button big fit" style="margin-top: 30px;" runat="server" Text="Log In" OnClick="btn_Login_Click" />

            <a href="signup.aspx">Don't have an account?</a> 
        </div>
        <asp:SqlDataSource ID="SQLMovieDB" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString2 %>" SelectCommand="SELECT * FROM [USERS]"></asp:SqlDataSource>

</asp:Content>
