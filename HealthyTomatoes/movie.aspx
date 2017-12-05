<%@ Page Title="" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="movie.aspx.cs" Inherits="HealthyTomatoes.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_Main" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <AlternatingItemTemplate>
        <li style="background-color: #FFF8DC;">movie_title:
            <asp:Label ID="movie_titleLabel" runat="server" Text='<%# Eval("movie_title") %>' />
            <br />
            movie_rating:
            <asp:Label ID="movie_ratingLabel" runat="server" Text='<%# Eval("movie_rating") %>' />
            <br />
            movie_releaseYear:
            <asp:Label ID="movie_releaseYearLabel" runat="server" Text='<%# Eval("movie_releaseYear") %>' />
            <br />
        </li>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <li style="background-color: #008A8C;color: #FFFFFF;">movie_title:
            <asp:TextBox ID="movie_titleTextBox" runat="server" Text='<%# Bind("movie_title") %>' />
            <br />
            movie_rating:
            <asp:TextBox ID="movie_ratingTextBox" runat="server" Text='<%# Bind("movie_rating") %>' />
            <br />
            movie_releaseYear:
            <asp:TextBox ID="movie_releaseYearTextBox" runat="server" Text='<%# Bind("movie_releaseYear") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
        </li>
    </EditItemTemplate>
    <EmptyDataTemplate>
        No data was returned.
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <li style="">movie_title:
            <asp:TextBox ID="movie_titleTextBox" runat="server" Text='<%# Bind("movie_title") %>' />
            <br />
            movie_rating:
            <asp:TextBox ID="movie_ratingTextBox" runat="server" Text='<%# Bind("movie_rating") %>' />
            <br />
            movie_releaseYear:
            <asp:TextBox ID="movie_releaseYearTextBox" runat="server" Text='<%# Bind("movie_releaseYear") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
        </li>
    </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
    <ItemTemplate>
        <li style="background-color: #DCDCDC;color: #000000;">movie_title:
            <asp:Label ID="movie_titleLabel" runat="server" Text='<%# Eval("movie_title") %>' />
            <br />
            movie_rating:
            <asp:Label ID="movie_ratingLabel" runat="server" Text='<%# Eval("movie_rating") %>' />
            <br />
            movie_releaseYear:
            <asp:Label ID="movie_releaseYearLabel" runat="server" Text='<%# Eval("movie_releaseYear") %>' />
            <br />
        </li>
    </ItemTemplate>
    <LayoutTemplate>
        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
            <li runat="server" id="itemPlaceholder" />
        </ul>
        <div style="font-family: Verdana, Arial, Helvetica, sans-serif; text-align: center; background-color: #CCCCCC; color: #000000;">
        </div>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">movie_title:
            <asp:Label ID="movie_titleLabel" runat="server" Text='<%# Eval("movie_title") %>' />
            <br />
            movie_rating:
            <asp:Label ID="movie_ratingLabel" runat="server" Text='<%# Eval("movie_rating") %>' />
            <br />
            movie_releaseYear:
            <asp:Label ID="movie_releaseYearLabel" runat="server" Text='<%# Eval("movie_releaseYear") %>' />
            <br />
        </li>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT [movie_title], [movie_rating], [movie_releaseYear] FROM [MOVIE]"></asp:SqlDataSource>
</asp:Content>
