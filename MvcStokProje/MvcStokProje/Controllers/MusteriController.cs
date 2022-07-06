using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStokProje.Models.Entity;

namespace MvcStokProje.Controllers
{
    public class MusteriController : Controller
    {
        // GET: Musteri

        StokEntities db = new StokEntities();
        public ActionResult Index()
        {
            var degerler = db.TMusteriler.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniMusteri()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YeniMusteri(TMusteriler p1)
        { //[HttpPost]
            db.TMusteriler.Add(p1);
            db.SaveChanges();
            return View();
        }
        public ActionResult SIL(int id)
        {
            var kategori = db.TMusteriler.Find(id);
            db.TMusteriler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}