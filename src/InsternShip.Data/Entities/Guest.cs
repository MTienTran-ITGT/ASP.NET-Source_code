using System;
using System.Collections.Generic;

namespace InsternShip.Data.Entities;

public partial class Guest
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateTime RegisterDate { get; set; }

    public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();
}
