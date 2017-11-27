<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MediaForum.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePH" runat="server">
    Log In or Create an Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBlockPH" runat="server">
    <div id="signIn">
        <h3>Sign In</h3>
        <div class="fieldSet">
            <div class="fieldLabel">Email:</div>
            <div class="fieldInput"><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></div>
            <div class="validator"><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationGroup="signInGroup"></asp:RequiredFieldValidator></div>
        </div>
        <div class="fieldSet">
            <div class="fieldLabel">Password:</div>
            <div class="fieldInput"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></div>
            <div class="validator"><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtPassword" SetFocusOnError="True" ValidationGroup="signInGroup"></asp:RequiredFieldValidator></div>
        </div>
        <div class="blockButton">
            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" ValidationGroup="signInGroup" OnClick="btnSignIn_Click" />
        </div>
    </div>
    <div id="error"><asp:Label ID="lblDataSource" runat="server" Text="Label"></asp:Label></div>
    <div id="createAccount">
        <h3>Create Account</h3>
        <div class="fieldSet">
            <div class="fieldLabel">Email:</div>
            <div class="fieldInput"><asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox></div>
            <div class="validator"><asp:RequiredFieldValidator ID="rfvNewEmail" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtNewEmail" SetFocusOnError="True" ValidationGroup="createGroup"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="customValEmail" runat="server" OnServerValidate="customValEmail_ServerValidate" ErrorMessage="Email already in use" Display="Dynamic" ControlToValidate="txtNewEmail" SetFocusOnError="True" ValidationGroup="createGroup"></asp:CustomValidator>
            </div>
        </div>
        <div class="fieldSet">
            <div class="fieldLabel">Password:</div>
            <div class="fieldInput"><asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox></div>
            <div class="validator"><asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtPassword" SetFocusOnError="True" ValidationGroup="createGroup"></asp:RequiredFieldValidator></div>
        </div>
        <div class="fieldSet">
            <div class="fieldLabel">Confirm Password:</div>
            <div class="fieldInput"><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox></div>
            <div class="validator"><asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Passwords must match" Display="Dynamic" ControlToValidate="txtConfirmPassword" SetFocusOnError="True" ValidationGroup="createGroup" ControlToCompare="txtNewPassword"></asp:CompareValidator></div>
        </div>
        <div class="fieldSet">
            <div class="fieldLabel">Display Name:</div>
            <div class="fieldInput"><asp:TextBox ID="txtDisplayName" runat="server"></asp:TextBox></div>
            <div class="validator"><asp:RequiredFieldValidator ID="rfvDisplayName" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtDisplayName" SetFocusOnError="True" ValidationGroup="createGroup"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="customValDisplayName" runat="server" OnServerValidate="customValDisplayName_ServerValidate" ErrorMessage="Name already in use" Display="Dynamic" ControlToValidate="txtDisplayName" SetFocusOnError="True" ValidationGroup="createGroup"></asp:CustomValidator>
            </div>
        </div>
        <div class="blockButton">
            <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" ValidationGroup="createGroup" />
        </div>
    </div>
</asp:Content>
