using System;
using System.Collections.Generic;

namespace InsternShip.Data.Entities;

public partial class Reservation
{
    public int Id { get; set; }

    public int RoomId { get; set; }

    public int GuestId { get; set; }

    public DateTime CheckinDate { get; set; }

    public DateTime CheckoutDate { get; set; }

    public virtual Guest Guest { get; set; } = null!;

    public virtual Room Room { get; set; } = null!;
}
