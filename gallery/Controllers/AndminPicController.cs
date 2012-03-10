using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using gallery.Models;
namespace gallery.Controllers
{
    public class AndminPicController : Controller
    {
        private pictersDBEntities db = new pictersDBEntities();
        //
        // GET: /AndminPic/
        [Authorize(Roles="Admins")]
        public ActionResult Index()
        {
            var picters = (from picture in db.pictures select picture).ToList();
            return View(picters);
        }

        //
        // GET: /AndminPic/Details/5
        [Authorize(Roles = "Admins")]
        public ActionResult Details(int id)
        {
            var picterDetal = (from picture in db.pictures
                               where picture.id == id
                               select picture).First();
            return View(picterDetal);
        }

        //
        // GET: /AndminPic/Create
        [Authorize(Roles = "Admins")]
        public ActionResult Create()
        {
            picture pict = new picture();
            return View(pict);
        } 

        //
        // POST: /AndminPic/Create

        [HttpPost]
        [Authorize(Roles = "Admins")]
        public ActionResult Create(picture pict)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.AddTopictures(pict);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                ModelState.AddModelError("Неправильні введені дані", ex);
            }
            return View(pict);
        }
        
        //
        // GET: /AndminPic/Edit/5
        [Authorize(Roles = "Admins")]
        public ActionResult Edit(int id)
        {
            var picterEdit = (from picture in db.pictures
                               where picture.id == id
                               select picture).First();
            return View(picterEdit);
        }

        //
        // POST: /AndminPic/Edit/5

        [HttpPost]
        [Authorize(Roles = "Admins")]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var picterEdit = (from picture in db.pictures
                              where picture.id == id
                              select picture).First();
            try
            {
                UpdateModel(picterEdit);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(picterEdit);
            }
        }

        //
        // GET: /AndminPic/Delete/5
        [Authorize(Roles = "Admins")]
        public ActionResult Delete(int id)
        {
            var picterDel = (from picture in db.pictures
                               where picture.id == id
                               select picture).First();
            return View(picterDel);
        }

        //
        // POST: /AndminPic/Delete/5

        [HttpPost]
        [Authorize(Roles = "Admins")]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var picterDel = (from picture in db.pictures
                             where picture.id == id
                             select picture).First();
            try
            {
                db.DeleteObject(picterDel);
                db.SaveChanges();
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View(picterDel);
            }
        }
    }
}
