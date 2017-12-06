<%@ Page Title="" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="rate.aspx.cs" Inherits="HealthyTomatoes.rate" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/index.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_Links" runat="server">
    <li><asp:HyperLink ID="hl_login" runat="server"> <asp:Label ID="lbl_Link" runat="server" Text="Label"></asp:Label> </asp:HyperLink></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_Main" runat="server">
    <style type="text/css">
        .Star
        {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
    <div class="movieContainer">
        <div class="header"> 
            <h1> <asp:Label ID="lbl_header" runat="server" Text="Rate Movie"></asp:Label> </h1> 
        </div>
        <div class="title">
            <asp:Label ID="lbl_movieTitle" runat="server"></asp:Label>
        </div>
        <asp:Image ID="movie_Image" runat="server" Height="300" Width="200"/>
        <div class="rating">
            <p> <asp:Label ID="lbl_movieRatings" runat="server"></asp:Label> </p>
        </div>
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <cc1:Rating ID="Rating1" AutoPostBack="true" OnChanged="OnRatingChanged" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar">
    </cc1:Rating>
    <br />
    <asp:Label ID="lblRatingStatus" runat="server" Text=""></asp:Label>
        <div class="actionRate">
            <asp:Label ID="lbl_rate" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>
