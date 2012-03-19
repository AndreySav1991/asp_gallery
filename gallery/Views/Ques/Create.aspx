<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainMaster.Master" Inherits="System.Web.Mvc.ViewPage<gallery.Models.ques>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 

    

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Питання</legend>
            

            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.name) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.name) %>
                <%: Html.ValidationMessageFor(model => model.name) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.email) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.email) %>
                <%: Html.ValidationMessageFor(model => model.email) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.question) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.question) %>
                <%: Html.ValidationMessageFor(model => model.question) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>



</asp:Content>

