<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.Users>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    
    <fieldset>
        <legend>Видалити</legend>
        
        <div class="display-label">id</div>
        <div class="display-field"><%: Model.id %></div>
        
        <div class="display-label">name</div>
        <div class="display-field"><%: Model.name %></div>
        
        <div class="display-label">email</div>
        <div class="display-field"><%: Model.email %></div>
        
        <div class="display-label">adress</div>
        <div class="display-field"><%: Model.adress %></div>
        
        <div class="display-label">tel</div>
        <div class="display-field"><%: Model.tel %></div>
        
        <div class="display-label">id_pic</div>
        <div class="display-field"><%: Model.id_pic %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Назад", "Index") %>
        </p>
    <% } %>

</asp:Content>

