<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainMaster.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<gallery.Models.picture>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gallery
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <script src="/Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="/Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-1.4.1.js" type="text/javascript"></script>
 
  





            <div id="pictureDiv">
             <% Html.RenderPartial( "GalleryPage", Model, Html.ViewData); %> 
            </div>

</asp:Content>

