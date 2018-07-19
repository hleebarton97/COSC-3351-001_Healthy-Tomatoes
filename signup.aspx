<%@ Page Title="" UnobtrusiveValidationMode="none" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="HealthyTomatoes.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Sign Up at Healthy Tomatoes </title>
    <link rel="stylesheet" href="assets/css/login.css" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_Links" runat="server">

    <li><asp:HyperLink ID="hl_login" runat="server"> <asp:Label ID="lbl_Link" runat="server" Text="Label"></asp:Label> </asp:HyperLink></li>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_Main" runat="server">

    <div class="login" validationexpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&amp;*-]).{8,}$">
        <asp:TextBox ID="signup_fName" placeholder="First Name" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_fName" runat="server" ErrorMessage="* First name is required!" ControlToValidate="signup_fName" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

        <asp:TextBox ID="signup_lName" placeholder="Last Name" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_lName" runat="server" ErrorMessage="* Last name is required!" ControlToValidate="signup_lName" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

        <asp:TextBox ID="signup_email" placeholder="Email Address" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_email" runat="server" ErrorMessage="* Email address is required!" ControlToValidate="signup_email" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev_email" runat="server" ErrorMessage="* Incorrect email format!" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="signup_email" Display="Dynamic"></asp:RegularExpressionValidator>

        <asp:TextBox ID="signup_dob" placeholder="Date of Birth (MM/DD/YYYY)" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_dob" runat="server" ErrorMessage="* Date of birth is required!" ControlToValidate="signup_dob" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ID="rev_date" runat="server" ControlToValidate="signup_dob" Display="Dynamic" ErrorMessage="* Invalid date format!" ForeColor="#CC0000" ValidationExpression="^(((((0[13578])|([13578])|(1[02]))[\-\/\s]?((0[1-9])|([1-9])|([1-2][0-9])|(3[01])))|((([469])|(11))[\-\/\s]?((0[1-9])|([1-9])|([1-2][0-9])|(30)))|((02|2)[\-\/\s]?((0[1-9])|([1-9])|([1-2][0-9]))))[\-\/\s]?\d{4})(\s(((0[1-9])|([1-9])|(1[0-2]))\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|am|pm]{2,2})))?$"></asp:RegularExpressionValidator>

        <asp:TextBox ID="signup_username" placeholder="Username" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="* Username is required!" ControlToValidate="signup_dob" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

        <asp:TextBox ID="signup_password" placeholder="Password" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_password" runat="server" ErrorMessage="* Password is required!" ControlToValidate="signup_password" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev_password" runat="server" ErrorMessage="* Password must contain a capital letter, a number, and special character!" ForeColor="#CC0000" Display="Dynamic" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&amp;*-]).{8,}$" SetFocusOnError="False" ControlToValidate="signup_password"></asp:RegularExpressionValidator>

        <asp:TextBox ID="signup_rePassword" placeholder="Repeat Password" style="margin-top: 10px;" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_rePassword" runat="server" ErrorMessage="* You must repeat your password!" ControlToValidate="signup_rePassword" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cv_password" runat="server" ErrorMessage="* Passwords do not match!" ControlToCompare="signup_password" ControlToValidate="signup_rePassword" Display="Dynamic" ForeColor="#CC0000"></asp:CompareValidator>

        <asp:Label ID="lbl_error" runat="server" Text="Label" Visible="False" ForeColor="#CC0000"></asp:Label>

        <asp:Button ID="btn_SignUp" CssClass="button big fit" style="margin-top: 30px;" runat="server" Text="Sign Up" OnClick="btn_SignUp_Click" />

        <a href="login.aspx">Already have an account?</a>
    </div>

    <asp:SqlDataSource ID="SQLMovieDB" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT * FROM [USERS]"></asp:SqlDataSource>

</asp:Content>
