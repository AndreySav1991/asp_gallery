<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.ques>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Дійсно видалити питання?</h3>
    <fieldset>
        <legend>Fields</legend>

        
        <div class="display-label">Імя</div>
        <div class="display-field"><%: Model.name %></div>
        
        <div class="display-label">Пошта</div>
        <div class="display-field"><%: Model.email %></div>
        
        <div class="display-label">Питання</div>
        <div class="display-field"><%: Model.question %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Видалити" /> |
		    <%: Html.ActionLink("Назад", "Index") %>
        </p>
    <% } %>

</asp:Content>

