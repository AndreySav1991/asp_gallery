<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminPic.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.picture>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Нова картина</legend>
            
  
            
            <%: Html.EditorFor(model => model) %>
            

     </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink("Назад до списку", "Index") %>
    </div>

</asp:Content>

