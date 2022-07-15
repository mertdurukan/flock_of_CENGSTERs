using Microsoft.AspNetCore.Mvc;

namespace PO_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenelController : Controller
    {

        // https://localhost:44301/Genel

        public IActionResult Index()
        {
            return Ok("x");
        }
    }
}
