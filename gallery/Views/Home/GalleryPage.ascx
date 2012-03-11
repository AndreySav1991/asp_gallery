<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<gallery.Models.picture>>" %>

    <table border="1">
        <tr>
            
            <th>
              
            </th>
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
                <%: Html.ActionLink("Купити", "Details", new { id=item.id })%>
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
                   <%: Ajax.AjaxPagingNavigator("pictureDiv", (int)Ajax.ViewData["PageNum"],
        (int)Ajax.ViewData["ItemsCount"], (int)Ajax.ViewData["PageSize"], 5) %>
                
            </p >


