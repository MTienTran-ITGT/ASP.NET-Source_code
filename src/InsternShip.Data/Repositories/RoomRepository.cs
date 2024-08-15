using InsternShip.Data.Entities;
using InsternShip.Data.Interfaces;
using InsternShip.Data.Model;
using InsternShip.Data.ViewModels;
using Microsoft.EntityFrameworkCore;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace InsternShip.Data.Repositories
{
    public class RoomRepository : Repository<Room>, IRoomRepository
    {
        private readonly IUnitOfWork _uow;
        public RoomRepository(MyHotelDb context, IUnitOfWork uow) : base(context) 
        {
            _uow = uow;
        }
        public async Task<IEnumerable<RoomViewModel>> GetAllRoom(string? request)
        {
            var listData = new List<RoomViewModel>();
            if (string.IsNullOrEmpty(request))
            {
                var data = await Entities.Take(10).ToListAsync();
                foreach (var item in data)
                {
                    var obj = new RoomViewModel
                    {
                        AllowedSmoking = item.AllowedSmoking,
                        Name = item.Name,
                        Number = item.Number,
                        Status = item.Status
                    };
                    listData.Add(obj);
                }
                return listData;
            } else
            {
                var data = await Entities.Where(x=>x.Name == request).Take(10).ToListAsync();
                foreach (var item in data)
                {
                    var obj = new RoomViewModel
                    {
                        AllowedSmoking = item.AllowedSmoking,
                        Name = item.Name,
                        Number = item.Number,
                        Status = item.Status
                    };
                    listData.Add(obj);
                }
                return listData;
            }
        }

        public async Task<bool> SaveRoom(RoomCreateRequest request)
        {
            var room = new Room()
            {
                Name = request.Name,
                AllowedSmoking = request.AllowedSmoking,
                Number = request.Number,
                Status = 0,
            };
            Entities.Add(room);
            _uow.SaveChanges();
            return await Task.FromResult(true);
        }
    }
}
