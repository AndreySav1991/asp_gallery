using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using gallery.Models;

namespace gallery.Controllers
{
    public class QuesController : Controller
    {

        pictersDB newQues = new pictersDB();

        //
        // GET: /Ques/
        [Authorize(Roles = "Admins")]
        public ActionResult Index()
        {
            var ques1 = (from ques in newQues.ques select ques).ToList();
            return View(ques1);
        }



        //
        // GET: /Ques/Create
        
        public ActionResult Create()
        {
            ques ques1 = new ques();
            return View(ques1);
        } 

        //
        // POST: /Ques/Create

        [HttpPost]
        public ActionResult Create(ques ques1)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    newQues.AddToques(ques1);

                    newQues.SaveChanges();

                    return Redirect("/#/Content/pict/1.jpg");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Неправильні введені дані", ex);
            }
            return View(ques1);
        }
        
   

        //
        // GET: /Ques/Delete/5
        [Authorize(Roles = "Admins")]
        public ActionResult Delete(int id)
        {
            var picterDel = (from ques in newQues.ques
                             where ques.id == id
                             select ques).First();
            return View(picterDel);
        }

        //
        // POST: /Ques/Delete/5

        [HttpPost]
        [Authorize(Roles = "Admins")]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var quesDel = (from ques in newQues.ques
                             where ques.id == id
                             select ques).First();
            try
            {
                newQues.DeleteObject(quesDel);
                newQues.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View(quesDel);
            }
        }
    }
}
