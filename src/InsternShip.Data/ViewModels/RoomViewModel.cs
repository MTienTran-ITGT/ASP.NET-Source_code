using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsternShip.Data.ViewModels
{
    public class RoomViewModel
    {
        public int Number { get; set; }

        public string? Name { get; set; }

        public int Status { get; set; }

        public bool AllowedSmoking { get; set; }
    }
}
