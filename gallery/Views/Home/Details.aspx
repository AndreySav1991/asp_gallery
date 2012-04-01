<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainMaster.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.picture>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <fieldset>
        <legend>Деталі</legend>
        
        
        <div class="display-label">Назва картини</div>
        <div class="display-field"><%: Model.nazva %></div>
        
        <div class="display-label">Автор</div>
        <div class="display-field"><%: Model.avtor %></div>
                
        <div class="display-label">Ціна</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.price) %></div>

        
        <div class="display-field"><img src="/Content/pict/<%: Model.img %>" /></div>
    </fieldset>
    <p>

        <a href="/User/Create/<%:Model.id %>">Оформити замовлення</a>
        <br />
        <%: Html.ActionLink("Назад", "Gallery") %>
    </p>

</asp:Content>

