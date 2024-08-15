using Azure;
using InsternShip.Data.Model;
using InsternShip.Service.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace InsternShip.Api.Controllers
{
    public class RoomController : BaseAPIController
    {
        private readonly IRoomService _roomService;
        public RoomController(IRoomService roomService)
        {
            _roomService = roomService;
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetAllRoom(string? search)
        {
            var roomList = await _roomService.GetAllRoom(search);
            return Ok(roomList);
        }
        [HttpPost("[action]")]
        public async Task<IActionResult> SaveRoom(RoomCreateRequest request)
        {
            var roomList = await _roomService.SaveRoom(request);
            return Ok(roomList);
        }
    }
}
