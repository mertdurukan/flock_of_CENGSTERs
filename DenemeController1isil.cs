using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PO_API.Models;

namespace PO_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DenemeController : Controller
    {
        string local_ConnectionString = "data source=BASE-PC;initial catalog=TEST_DB;persist security info=True;user id=sas;password=123;Trusted_Connection= true;";

        //  https://localhost:44301/api/Deneme/example-select
        [HttpGet("example-select")]
        public IActionResult Index()
        {
            var listExample = new List<Example>();
            var sayisi = -1;

            using (var connection = new SqlConnection(local_ConnectionString))
            {
                var sql = "SELECT * FROM EXAMPLE";
                listExample = connection.Query<Example>(sql).ToList();
            }

            using (var connection = new SqlConnection(local_ConnectionString))
            {
                var sql = "SELECT COUNT(*) FROM EXAMPLE";
                sayisi = (int)connection.ExecuteScalar(sql);
            }
           
         // return Ok(sayisi);
            return Ok(listExample);
        }
    }
}