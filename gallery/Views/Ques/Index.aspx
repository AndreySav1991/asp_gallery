<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<gallery.Models.ques>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <table border="2">
        <tr>
            <th></th>
   
            <th>
                Імя
            </th>
            <th>
                Пошта
            </th>
            <th>
                Питання
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>

                <%: Html.ActionLink("Видалити", "Delete", new { id=item.id })%>
            </td>

            <td>
                <%: item.name %>
            </td>
            <td>
                <%: item.email %>
            </td>
            <td>
                <%: item.question %>
            </td>
        </tr>
    
    <% } %>

    </table>



</asp:Content>

