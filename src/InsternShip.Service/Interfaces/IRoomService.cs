using InsternShip.Data.Model;
using InsternShip.Data.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsternShip.Service.Interfaces
{
    public interface IRoomService
    {
        Task<IEnumerable<RoomViewModel>> GetAllRoom(string? request);
        Task<bool> SaveRoom(RoomCreateRequest request);
    }
}
