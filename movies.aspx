<%@ Page Title="" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="movies.aspx.cs" Inherits="HealthyTomatoes.movies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Links" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_Main" runat="server">

    <asp:Table ID="table_movies" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">  </asp:TableCell>
            <asp:TableCell runat="server">  </asp:TableCell>
            <asp:TableCell runat="server">  </asp:TableCell>
            <asp:TableCell runat="server">  </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
