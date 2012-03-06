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

        public ActionResult Index()
        {
            var picters = (from picture in db.pictures select picture).ToList();
            return View(picters);
        }

        public ActionResult Gallery()
        {
            var picters = (from picture in db.pictures select picture).ToList();
            return View(picters);
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
