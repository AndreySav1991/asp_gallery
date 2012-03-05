<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainMaster.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<gallery.Models.picture>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gallery
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gallery</h2>

    <table>
        <tr>
            <th>
                id
            </th>
            <th>
                nazva
            </th>
            <th>
                avtor
            </th>
            <th>
                img
            </th>
            <th>
                price
            </th>
        </tr>

    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: item.id %>
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

   

</asp:Content>

