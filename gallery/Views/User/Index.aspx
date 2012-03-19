<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<gallery.Models.Users>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Список покупців</h2>

    <table border="2">
        <tr>
            <th></th>

            <th>
                П.І.П
            </th>
            <th>
                Пошта
            </th>
            <th>
                Адресса
            </th>
            <th>
                Телефон
            </th>
            <th>
                Картина
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>

                <%: Html.ActionLink("Delete", "Delete", new { id=item.id })%>
            </td>

            <td>
                <%: item.name %>
            </td>
            <td>
                <%: item.email %>
            </td>
            <td>
                <%: item.adress %>
            </td>
            <td>
                <%: item.tel %>
            </td>
            <td>
                <%: item.id_pic %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

