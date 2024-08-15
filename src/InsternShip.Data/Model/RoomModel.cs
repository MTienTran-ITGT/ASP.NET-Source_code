
namespace InsternShip.Data.Model
{
    public class RoomCreateRequest
    {
        public int Id { get; set; }

        public int Number { get; set; }

        public string? Name { get; set; }

        public int Status { get; set; }

        public bool AllowedSmoking { get; set; }
    }
}
