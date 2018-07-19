<%@ Page Title="" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HealthyTomatoes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Healthy Tomatoes Home </title>
    <link rel="stylesheet" href="assets/css/index.css" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_Links" runat="server">

    <li><asp:HyperLink ID="hl_login" runat="server"> <asp:Label ID="lbl_Link" runat="server" Text="Label"></asp:Label> </asp:HyperLink></li>
    <asp:SqlDataSource ID="SQLMovieDB_ratings" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString2 %>" SelectCommand="SELECT * FROM [RATINGS]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLMovieDB_movie" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString2 %>" SelectCommand="SELECT * FROM [MOVIE]"></asp:SqlDataSource>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_Main" runat="server">

    <div class="movieContainer">
        <div class="header"> 
            <h1> Top Rated Movie </h1> 
        </div>
        <div class="title">
            <asp:Label ID="lbl_movieTitle" runat="server"></asp:Label>
        </div>
        <asp:ImageButton ID="img_movie" runat="server" Height="300px" OnClick="img_movie_Click" Width="200px" />
        <div class="rating">
            <p> Average User Rating: <asp:Label ID="lbl_movieRatings" runat="server"></asp:Label> / 4 stars </p>
        </div>
    </div>
    <asp:Label ID="lbl_movieID" runat="server" Visible="False"></asp:Label>

</asp:Content>
