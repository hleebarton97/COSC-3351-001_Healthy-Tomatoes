<%@ Page Title="" Language="C#" MasterPageFile="~/HealthyTomatoes.Master" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="HealthyTomatoes.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Links" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_Login" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_Main" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="user_code" DataSourceID="SqlDataSource1" Height="50px" Width="510px" OnItemUpdated="DetailsView1_ItemUpdated">
        <Fields>
            <asp:TemplateField HeaderText="User ID" InsertVisible="False" SortExpression="user_code">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("user_code") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("user_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username" SortExpression="user_username">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("user_username") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("user_username") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("user_username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="user_password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("user_password") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("user_password") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("user_password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="user_fname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("user_fname") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("user_fname") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("user_fname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="user_lname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("user_lname") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("user_lname") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("user_lname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="user_email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("user_email") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("user_email") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("user_email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DOB" SortExpression="user_DOB">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("user_DOB") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("user_DOB") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("user_DOB") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" />
        </Fields>
    </asp:DetailsView>

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="movie_title" HeaderText="Movie Title" SortExpression="movie_title" />
            <asp:BoundField DataField="rating" HeaderText="Your Rating" SortExpression="rating" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Prev" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString2 %>" DeleteCommand="DELETE FROM [USERS] WHERE [user_code] = @user_code" InsertCommand="INSERT INTO [USERS] ([user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (@user_username, @user_password, @user_fname, @user_lname, @user_email, @user_DOB)" SelectCommand="SELECT * FROM [USERS]" UpdateCommand="UPDATE [USERS] SET [user_username] = @user_username, [user_password] = @user_password, [user_fname] = @user_fname, [user_lname] = @user_lname, [user_email] = @user_email, [user_DOB] = @user_DOB WHERE [user_code] = @user_code">
        <DeleteParameters>
            <asp:Parameter Name="user_code" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="user_username" Type="String" />
            <asp:Parameter Name="user_password" Type="String" />
            <asp:Parameter Name="user_fname" Type="String" />
            <asp:Parameter Name="user_lname" Type="String" />
            <asp:Parameter Name="user_email" Type="String" />
            <asp:Parameter DbType="Date" Name="user_DOB" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_username" Type="String" />
            <asp:Parameter Name="user_password" Type="String" />
            <asp:Parameter Name="user_fname" Type="String" />
            <asp:Parameter Name="user_lname" Type="String" />
            <asp:Parameter Name="user_email" Type="String" />
            <asp:Parameter DbType="Date" Name="user_DOB" />
            <asp:Parameter Name="user_code" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString2 %>" SelectCommand="SELECT MOVIE.movie_title, RATINGS.rating FROM MOVIE INNER JOIN RATINGS ON MOVIE.movie_id = RATINGS.m_id WHERE (RATINGS.u_id = @u_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="u_id" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
