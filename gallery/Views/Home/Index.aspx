<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainMaster.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<gallery.Models.picture>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>




 

    <div class="index">
       <div id="main_image"></div>
        <ul class="gallery_index_unstyled">
           <% foreach (var item in Model) { %>
             <li><img  src="/Content/pict/<%: item.img %>" alt="<%: item.nazva %>"  title="<%: item.nazva %> цена  <%: String.Format("{0:F}", item.price) %>  автор:  <%: item.avtor %>"></li>
           <% } %>
</ul>
<p class="nav"><a href="" onclick="$.galleria.prev(); return false;">&laquo; Попередня</a> | <a href="" onclick="$.galleria.next(); return false;">Наступна &raquo;</a></p>
</div>

   


   <a href="/Home/Gallery">gal</a>

</asp:Content>

