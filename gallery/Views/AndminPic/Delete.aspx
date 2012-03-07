<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.picture>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <h3>Дійсно бажаєте видалити? </h3>
    <fieldset>
        <legend>Видалити</legend>

        
        <div class="display-label">Назва</div>
        <div class="display-field"><%: Model.nazva %></div>
        
        <div class="display-label">Автор</div>
        <div class="display-field"><%: Model.avtor %></div>
        
        <div class="display-label">Шлях до зображення</div>
        <div class="display-field"><%: Model.img %></div>
        
        <div class="display-label">Ціна</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.price) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Видалити" /> |
		    <%: Html.ActionLink("Назад до списку", "Index") %>
        </p>
    <% } %>

</asp:Content>

