<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<gallery.Models.picture>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Адмінка
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Головна </h2>
            [ <%: Html.ActionLink("Выход", "LogOff", "Account") %> ]
            <br />
    <table border="1">
        <tr>
            <th></th>
            <th>
                Назва
            </th>
            <th>
                Автор
            </th>
            <th>
                Зображення
            </th>
            <th>
                Ціна
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Редагувати", "Edit", new { id=item.id }) %> |
                <%: Html.ActionLink("Деталі", "Details", new { id=item.id })%> |
                <%: Html.ActionLink("Видалити", "Delete", new { id=item.id })%>
            </td>
            <td>
                <%: item.nazva %>
            </td>
            <td>
                <%: item.avtor %>
            </td>
            <td>
               <img src="/Content/pict/<%: item.img %>" height="50" width="50" />
            </td>
            <td>
                <%: String.Format("{0:F}", item.price) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Створити нову картину", "Create") %>
    </p>

</asp:Content>

