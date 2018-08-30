<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:SqlDataSource ID="usersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT [UserId], [UserName], [LastActivityDate] FROM [aspnet_Users]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"

        InsertCommand="INSERT INTO [aspnet_Users] ([UserName]) VALUES (@UserName)"
        SelectCommand="SELECT [UserName], [LastActivityDate] FROM [aspnet_Users] WHERE ([UserId] = @UserId)"
        UpdateCommand="UPDATE [aspnet_Users] SET [UserName] = @UserName WHERE [UserId] = @UserId">



        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
        </InsertParameters>

        <SelectParameters>
            <asp:ControlParameter ControlID="grid" Name="UserId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>






    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="usersDataSource" DataKeyNames="UserId">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="UserId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:ButtonField CommandName="Select" Text="Select" />
        </Columns>
    </asp:GridView>

    <br />
    <br />



    <asp:DetailsView ID="userDetailsView" runat="server" AutoGenerateRows="False" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" DataSourceID="userDataSource" DataKeyNames="CategoryId"
        OnItemDeleted="userDetails_ItemDeleted"
        OnItemInserted="userDetails_ItemInserted"
        OnItemUpdated="userDetails_ItemUpdated">

        <HeaderTemplate>
            <%#Eval("UserName") == null ? "Adding New User..." : "Details of User: " + Eval("UserName")%>
        </HeaderTemplate>

        <Fields>
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="true" InsertVisible="False" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
        </Fields>
    </asp:DetailsView>




    <p>
        <asp:LinkButton ID="addUserButton" runat="server"
            Text="* Add New User Here" OnClick="addUserButton_Click" />
    </p>
</asp:Content>
