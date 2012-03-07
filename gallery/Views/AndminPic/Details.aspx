<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.picture>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

    <fieldset>
        <legend>Деталі</legend>
        

        
        <div class="display-label">Назва</div>
        <div class="display-field"><%: Model.nazva %></div>
        
        <div class="display-label">Автор</div>
        <div class="display-field"><%: Model.avtor %></div>
        
        <div class="display-label">Зображення</div>
        <div class="display-field"><img src="/Content/pict/<%: Model.img %>" /></div>
                
        <div class="display-label">Ціна</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.price) %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Редагувати", "Edit", new { id=Model.id }) %> |
        <%: Html.ActionLink("Назад до списку", "Index") %>
    </p>

</asp:Content>

