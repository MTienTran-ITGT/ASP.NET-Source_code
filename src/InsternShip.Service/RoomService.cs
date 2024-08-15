using InsternShip.Data.Interfaces;
using InsternShip.Data.Model;
using InsternShip.Data.ViewModels;
using InsternShip.Service.Interfaces;


namespace InsternShip.Service
{
    public class RoomService : IRoomService
    {
        private readonly IRoomRepository _roomRepository;

        public RoomService(IRoomRepository roomRepository)
        {
            _roomRepository = roomRepository;
        }
        public Task<IEnumerable<RoomViewModel>> GetAllRoom(string? request)
        {
            return _roomRepository.GetAllRoom(request);
        }

        public async Task<bool> SaveRoom(RoomCreateRequest request)
        {
            return await _roomRepository.SaveRoom(request);
        }
    }
}
