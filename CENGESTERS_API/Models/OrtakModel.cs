namespace CENGESTERS_API.Models
{
    // servisin göndermiş olduğu yanıt
    public class ServiceResponse<T>
    {
        public List<T> icerik { get; set; } = new List<T>();
        public string HataMesajı { get; set; } = "";

    }
}
