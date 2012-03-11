using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using gallery.Models;

namespace gallery.Controllers
{
    public class HomeController : Controller
    {
        private pictersDBEntities db = new pictersDBEntities();
        private int pageSize = 5;


        public ActionResult Index()
        {
            var picters = (from picture in db.pictures select picture).ToList();
            return View(picters);
        }

        public ActionResult Gallery(int pageNum = 0)
        {
            ViewData["pageNum"] = pageNum;
            ViewData["itemsCount"] = db.pictures.Count();
            ViewData["pageSize"] = pageSize;
            
            var picters = (from picture in db.pictures orderby picture.nazva  select picture)
                .Skip(pageSize*pageNum).Take(pageSize).ToList();

            if (!Request.IsAjaxRequest())
            {

                return View(picters);
            }
            else
            {
                return PartialView("GalleryPage",picters);
            }
        }

        public ActionResult Details(int id = 2)
        {
            var picterDetal = (from picture in db.pictures
                           where picture.id == id
                           select picture).First();
            return View(picterDetal);
        }

        public ActionResult Contact()
        {
            
            return View();
        }


    }
}
