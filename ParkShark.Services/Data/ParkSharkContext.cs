﻿using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using ParkShark.Model.Divisions;
using ParkShark.Model.Parkinglots;
using ParkShark.Model.Parkinglots.BuildingTypes;
using ParkShark.Model.Persons;

namespace ParkShark.Services.Data
{
    public class ParkSharkContext : DbContext
    {
<<<<<<< HEAD
        private readonly string _connectionString;
        private readonly ILoggerFactory _loggerFactory;

        public virtual DbSet<Person> Persons { get; set; }
        public virtual DbSet<Parkinglot> Parkinglots { get; set; }

        public ParkSharkContext(ILoggerFactory loggerFactory = null)
        {
            _connectionString = "Data Source=.\\SQLExpress;Initial Catalog=ParkShark;Integrated Security=True;";
            _loggerFactory = loggerFactory;
=======
        public ParkSharkContext()
        {
>>>>>>> 0cc210d121a2ef8f07ea9c25f1e9deda8c00d89b
        }

        public ParkSharkContext(DbContextOptions<ParkSharkContext> options) : base(options)
        {
<<<<<<< HEAD
            optionsBuilder
                .UseSqlServer(this._connectionString);
            if (_loggerFactory != null)
            {
                optionsBuilder.UseLoggerFactory(_loggerFactory);
            }
            base.OnConfiguring(optionsBuilder);
=======
>>>>>>> 0cc210d121a2ef8f07ea9c25f1e9deda8c00d89b
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Division>()
                .ToTable("Divisions")
                .HasKey("ID");
<<<<<<< HEAD

            modelBuilder.Entity<Person>()
                .ToTable("Persons")
                .HasKey("ID");

            modelBuilder.Entity<Person>()
                .OwnsOne(person=>person.PersonAddress,
                    personAddress =>
                    {
                        personAddress.Property(prop => prop.StreetName).HasColumnName("StreetName");
                        personAddress.Property(prop => prop.StreetNumber).HasColumnName("StreetNumber");
                        personAddress.Property(prop => prop.PostalCode).HasColumnName("PostalCode");
                        personAddress.Property(prop => prop.CityName).HasColumnName("CityName");
                    });

            modelBuilder.Entity<Parkinglot>()
                .ToTable("ParkingLots")
                .HasKey("ID");


            modelBuilder.Entity<BuildingType>()
                .ToTable("BuildingTypes")
                .HasKey("ID");

            modelBuilder.Entity<Parkinglot>()
                .OwnsOne(parkinglot => parkinglot.PlAddress,
                    plAddress =>
                    {
                        plAddress.Property(prop => prop.StreetName).HasColumnName("StreetName");
                        plAddress.Property(prop => prop.StreetNumber).HasColumnName("StreetNumber");
                        plAddress.Property(prop => prop.PostalCode).HasColumnName("PostalCode");
                        plAddress.Property(prop => prop.CityName).HasColumnName("CityName");
                    });

            modelBuilder.Entity<Parkinglot>()
                .HasOne(parkinglot => parkinglot.ContactPerson)
                .WithMany(person => person.Parkinglots)
                .HasForeignKey(parkinglot => parkinglot.ContactPersonId)
                .IsRequired();

            modelBuilder.Entity<Parkinglot>()
                .HasOne(parkinglot => parkinglot.PlBuildingType)
                .WithMany(buildingType => buildingType.Parkinglots)
                .HasForeignKey(parkinglot => parkinglot.BuildingTypeId)
                .IsRequired();

            //TODO Add collection in Devision
            //public ICollection<Parkinglot> Parkinglots { get; } = new List<Parkinglot>();

            //modelBuilder.Entity<Parkinglot>()
            //    .HasOne(parkinglot => parkinglot.PlDivision)
            //    .WithMany(division => division.Parkinglots)
            //    .HasForeignKey(parkinglot => parkinglot.DivisionId)
            //    .IsRequired();

=======
>>>>>>> 0cc210d121a2ef8f07ea9c25f1e9deda8c00d89b
        }
    }
}
