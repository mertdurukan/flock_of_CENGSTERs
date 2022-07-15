using Microsoft.AspNetCore.Mvc;

namespace PO_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DenemeController : Controller
    {

        [HttpGet("index")]
        public IActionResult Index()
        {
            return Ok("Deneme çalıştı");
        }

        [HttpGet("ogrenci")]
        public IActionResult EkranaOgrencileriYaz()
        {
            return BadRequest("Başarısız");
        }

         // belirli özelliklere sahip birden çok olayım varsa 
         // ben bir interface tanımlayıp
         // o olayları interfaceden miras aldırırım
         // kalıtım alan class(sınıf) interfacedeki fonksiyon ya da değişkenleri
         // kendi parentezlerinde gerçeklemek zorunda
    }
}
