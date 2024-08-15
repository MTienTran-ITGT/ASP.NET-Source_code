using InsternShip.Data.Model;
using InsternShip.Data.ViewModels;

namespace InsternShip.Data.Interfaces
{
    public interface IRoomRepository
    {
        Task<IEnumerable<RoomViewModel>> GetAllRoom(string? request);
        Task<bool> SaveRoom(RoomCreateRequest request);
    }
}
