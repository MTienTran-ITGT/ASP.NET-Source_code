using InsternShip.Data.Interfaces;
using InsternShip.Data.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace InsternShip.Data
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddRepository(this IServiceCollection service)
        {
            service.AddTransient(typeof(IUnitOfWork), typeof(UnitOfWork));
            service.AddTransient(typeof(IRepository<>), typeof(Repository<>));
            service.AddTransient<IRoomRepository, RoomRepository>();
            return service;
        }
    }
}
