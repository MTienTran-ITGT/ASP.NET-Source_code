using System;
using System.Collections.Generic;

namespace InsternShip.Data.Entities;

public partial class Room
{
    public int Id { get; set; }

    public int Number { get; set; }

    public string? Name { get; set; }

    public int Status { get; set; }

    public bool AllowedSmoking { get; set; }

    public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();
}
