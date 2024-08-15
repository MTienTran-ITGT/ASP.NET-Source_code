using InsternShip.Data.Interfaces;
using InsternShip.Data.Repositories;
using InsternShip.Service.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsternShip.Service
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddServices(this IServiceCollection service)
        {
            service.AddTransient<IRoomService, RoomService>();
            return service;
        }
    }
}
