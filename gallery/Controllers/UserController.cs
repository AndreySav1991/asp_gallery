using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using gallery.Models;

namespace gallery.Controllers
{
    public class UserController : Controller
    {
        pictersDB db1 = new pictersDB();



        [Authorize(Roles = "Admins")]
        public ActionResult Index()
        {
            var user1 = (from user in db1.Users select user).ToList();


            return View(user1);
        }



        //
        // GET: /User/Create

        public ActionResult Create(int id)
        {
            Users user = new Users();
            user.id_pic = id.ToString();
            return View(user);
        } 

        //
        // POST: /User/Create
        [HttpPost]
        public ActionResult Create(Users user, int id)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    user.id_pic = id.ToString();
                    db1.AddToUsers(user);
                    db1.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Неправильні введені дані", ex);
            }
            return View(user);
        }
        
      
        //
        // GET: /User/Delete/5
                [Authorize(Roles = "Admins")]
        public ActionResult Delete(int id)
        {
            var userDel = (from user in db1.Users
                             where user.id == id
                             select user).First();
            return View(userDel);
        }

        //
        // POST: /User/Delete/5
        [Authorize(Roles = "Admins")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var userDel = (from user in db1.Users
                             where user.id == id
                             select user).First();
            try
            {
                db1.DeleteObject(userDel);
                db1.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View(userDel);
            }
        }
    }
}
