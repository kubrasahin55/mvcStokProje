using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStokProje.Models.Entity;

namespace MvcStokProje.Controllers
{
    public class SatisController : Controller
    {
        // GET: Satis
        StokEntities db = new StokEntities();
        public ActionResult Index()
        {
            var degerler = db.TSatislar.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniSatis()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YeniSatis(TSatislar p1)
        { //[HttpPost]
            db.TSatislar.Add(p1);
            db.SaveChanges();
            return View();
        }
        public ActionResult SIL(int id)
        {
            var kategori = db.TSatislar.Find(id);
            db.TSatislar.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}