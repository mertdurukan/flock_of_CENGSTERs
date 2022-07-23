using CENGESTERS_API.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;

namespace CENGESTERS_API.Controllers
{
    // IDyi client(kullanıcı) belirleseydi.

    [Route("api/[controller]")]
    [ApiController]
    public class IkiController : Controller
    {
        string local_ConnectionString = "data source=BASE-PC;initial catalog=CENGESTERS;persist security info=True;user id=sas;password=123;Trusted_Connection= true;";

        //  https://localhost:7298/api/Iki/get-soldiers?idDegerim=1
        [HttpGet("get-soldiers")]
        public IActionResult GetSoldiers(int idDegerim)
        {
            // eğer client bizden tek bir asker istiyorsa
            List<SOLDIERS> selectedSoldier = new List<SOLDIERS>();

            // eğer client bizden tüm askerleri istiyorsa
            List<SOLDIERS> listSoldiers = new List<SOLDIERS>();

            ServiceResponse<SOLDIERS> OrtakYanitModeli = new ServiceResponse<SOLDIERS>();

            void GetSoldier_ById(int idDegerim)
            {
                if (idDegerim > 0)
                {
                    using (var connection = new SqlConnection(local_ConnectionString))
                    {
                        var sql = "SELECT * FROM SOLDIERS WHERE ID = @idDegerim";

                        var prms = new
                        {
                            idDegerim = idDegerim
                        };

                        selectedSoldier = connection.Query<SOLDIERS>(sql, prms).ToList();
                    }
                    OrtakYanitModeli.icerik = selectedSoldier;
                    OrtakYanitModeli.HataMesajı = "Hata yok. Id değerim var. Ve içeriği seçili kullanıcı ile doldurdum.";
                }
                else
                {
                    using (var connection = new SqlConnection(local_ConnectionString))
                    {
                        var sql = "SELECT * FROM SOLDIERS";
                        listSoldiers = connection.Query<SOLDIERS>(sql).ToList();
                    }
                    OrtakYanitModeli.icerik = listSoldiers;
                    OrtakYanitModeli.HataMesajı = "Hata yok. Id değerim yok. Ve içeriği liste ile doldurdum.";
                }

            }

            GetSoldier_ById(idDegerim);

            return Ok(OrtakYanitModeli);  // JSON FORMATINDA GİDECEK    //  ortak yapımın içerisine seçili askeri ya da seçili listeyi koyucam.
        }
    }
}
