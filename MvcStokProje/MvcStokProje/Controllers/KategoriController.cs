using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStokProje.Models.Entity;

namespace MvcStokProje.Controllers
{
    public class KategoriController : Controller
    {
        // GET: Kategori

        StokEntities db = new StokEntities();
        public ActionResult Index()
        { //[HttpGet]
            var degerler = db.TKategoriler.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniKategori()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult YeniKategori(TKategoriler p1)
        { //[HttpPost]
            db.TKategoriler.Add(p1);
            db.SaveChanges();
            return View();
        }
        public ActionResult SIL(int id)
        {
            var kategori = db.TKategoriler.Find(id);
            db.TKategoriler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
            
        }
    }
}