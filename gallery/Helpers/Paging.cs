using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Text;
using System.Web.Mvc.Ajax;

namespace gallery.Helpers
{
    public static class Paging
    {
        public static MvcHtmlString PagingNavigator(this HtmlHelper helper, int pageNum, int itemsCount, int pageSize)
        {
            StringBuilder sb = new StringBuilder();
            if (pageNum > 0)
            {
                sb.Append(helper.ActionLink("<", "Gallery", new { pageNum = pageNum - 1 }));
            }
            else
            {
                sb.Append(HttpUtility.HtmlAttributeEncode("< "));
            }
            int pagesCount = (int)Math.Ceiling( (double)(itemsCount / pageSize) );
            sb.Append(" ");
            if (pageNum < pagesCount )
            {
                sb.Append(helper.ActionLink(">", "Gallery", new { pageNum = pageNum + 1 }));
            }
            else
            {
                sb.Append(HttpUtility.HtmlAttributeEncode("> "));
            }
            return MvcHtmlString.Create(sb.ToString());


        }


        public static MvcHtmlString AjaxPagingNavigator(this AjaxHelper helper, string updateTargetId,
            int pageNum, int itemsCount, int pageSize, int linksPerPage = 10,
            string actionName = "Gallery")
        {
            StringBuilder sb = new StringBuilder();
            int pagesCount = (int)Math.Ceiling((double)itemsCount / pageSize);
            int startPage = pageNum / linksPerPage * linksPerPage;
            int visiblePages = startPage + linksPerPage <=
                pagesCount ? linksPerPage : pagesCount - startPage;
            AjaxOptions ao = new AjaxOptions();
            ao.UpdateTargetId = updateTargetId;
            ao.OnBegin = "beginUpdate" + updateTargetId;
            ao.OnComplete = "completeUpdate" + updateTargetId;

            string script = @"
    <script type=""text/javascript"">
        var _currentPageNum = -1;

        Sys.Application.add_init(pageInitupdateTargetId);

        function pageInitupdateTargetId() {
            // Enable history
            Sys.Application.set_enableHistory(true);

            // Add Handler for history
            Sys.Application.add_navigate(navigateupdateTargetId);
        }

        function navigateupdateTargetId(sender, e) {
            // Get pageNum from address bar
            var pageNum = e.get_state().pageNum;

            // If pageNum != currentPageNum then navigate
            if (pageNum != _currentPageNum) {
                _currentPageNum = pageNum;
                $('#updateTargetId').load(""?pageNum="" + pageNum);
            }
        }

        function beginUpdateupdateTargetId(args) {
            _currentPageNum = this.getAttribute(""rel"");

            // Add history point
            Sys.Application.addHistoryPoint({ ""pageNum"": _currentPageNum });

            // Animate
            $('#updateTargetId').fadeOut('normal');
        }

        function completeUpdateupdateTargetId() {
            // Animate
            $('#updateTargetId').fadeIn('normal');
        }
    </script>";

            sb.AppendLine(script.Replace("updateTargetId", updateTargetId));

            if (pageNum > 0)
            {
                sb.Append(helper.ActionLink("<<", actionName, new { pageNum = 0 }, ao, new { rel = 0 }));
                sb.Append(" ");
                int pageBackNum = startPage - 1;
                if (pageBackNum > 0)
                {
                    sb.Append(helper.ActionLink("<", actionName, new { pageNum = pageBackNum },
                        ao, new { rel = pageBackNum }));
                }
                else
                {
                    sb.Append(HttpUtility.HtmlEncode("<"));
                }
            }
            else
            {
                sb.Append(HttpUtility.HtmlEncode("<< <"));
            }

            sb.Append(" ");

            for (int i = 0; i < visiblePages; i++)
            {
                int currentPage = i + startPage;
                string currentPageText = (currentPage + 1).ToString();
                if (currentPage != pageNum)
                {
                    sb.Append(helper.ActionLink(currentPageText, actionName,
                        new { pageNum = currentPage }, ao, new { rel = currentPage }));
                }
                else
                {
                    sb.Append(currentPageText);
                }
                sb.Append(" ");
            }

            sb.Append(" ");

            if (pageNum < pagesCount - 1)
            {
                int pageNextNum = startPage + visiblePages;
                if (pageNextNum < pagesCount)
                {
                    sb.Append(helper.ActionLink(">", actionName, new { pageNum = pageNextNum },
                        ao, new { rel = pageNextNum }));
                }
                else
                {
                    sb.Append(HttpUtility.HtmlEncode(">"));
                }
                sb.Append(" ");
                sb.Append(helper.ActionLink(">>", actionName, new { pageNum = (pagesCount - 1) },
                    ao, new { rel = (pagesCount - 1) }));
            }
            else
            {
                sb.Append(HttpUtility.HtmlEncode("> >>"));
            }

            return MvcHtmlString.Create(sb.ToString());
        }

    }
}