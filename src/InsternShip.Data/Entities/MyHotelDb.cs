using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace InsternShip.Data.Entities;

public partial class MyHotelDb : DbContext
{
    public MyHotelDb()
    {
    }

    public MyHotelDb(DbContextOptions<MyHotelDb> options)
        : base(options)
    {
    }

    public virtual DbSet<Guest> Guests { get; set; }

    public virtual DbSet<Reservation> Reservations { get; set; }

    public virtual DbSet<Room> Rooms { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=SQL5106.site4now.net;Initial Catalog=db_a9b127_myhoteldb;User Id=db_a9b127_myhoteldb_admin;Password=NguoiNaoDo1@3;Encrypt=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Guest>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(300);
        });

        modelBuilder.Entity<Reservation>(entity =>
        {
            entity.HasIndex(e => e.GuestId, "IX_Reservations_GuestId");

            entity.HasIndex(e => e.RoomId, "IX_Reservations_RoomId");

            entity.HasOne(d => d.Guest).WithMany(p => p.Reservations).HasForeignKey(d => d.GuestId);

            entity.HasOne(d => d.Room).WithMany(p => p.Reservations).HasForeignKey(d => d.RoomId);
        });

        modelBuilder.Entity<Room>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(200);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
