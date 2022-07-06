using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStokProje.Models.Entity;

namespace MvcStokProje.Controllers
{
    public class UrunController : Controller
    {
        // GET: Urun
        StokEntities db = new StokEntities();
        public ActionResult Index()
        {
            var degerler = db.TUrunler.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniUrun()
        {
            List<SelectListItem> degerler = (from i in db.TKategoriler.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.KategoriAd,
                                                 Value = i.KategoriId.ToString()
                                             }).ToList();
            ViewBag.dgr = degerler;
            return View();
        }
        [HttpPost]
        public ActionResult YeniUrun(TUrunler p1)
        { //[HttpPost]
            var ktg = db.TKategoriler.Where(m => m.KategoriId == p1.TKategoriler.KategoriId).FirstOrDefault();
                p1.TKategoriler = ktg;
             db.TUrunler.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult SIL(int id)
        {
            var kategori = db.TUrunler.Find(id);
            db.TUrunler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}