﻿using Microsoft.EntityFrameworkCore;
using NSubstitute;
using NSubstitute.ReturnsExtensions;
using ParkShark.Infrastructure.Exceptions;
using ParkShark.Model.Addresses;
using ParkShark.Model.Allocations;
using ParkShark.Model.Parkinglots;
using ParkShark.Model.Persons;
using ParkShark.Model.Persons.LicensePlates;
using ParkShark.Services.Data;
using ParkShark.Services.Repositories.Allocations;
using ParkShark.Services.Repositories.Parkinglots;
using ParkShark.Services.Repositories.Persons;
using System;
using System.Linq;
using Xunit;

namespace ParkShark.Services.Tests.Repositories
{
    public class AllocationRepositoryTest
    {
        private readonly IPersonRepository _personRepository;
        private readonly IParkinglotRepository _parkinglotRepository;

        public AllocationRepositoryTest()
        {
            _personRepository = Substitute.For<IPersonRepository>();
            _parkinglotRepository = Substitute.For<IParkinglotRepository>();
        }

        [Fact]
        public void GivenAnAllocation_WhenStartAllocation_ThenRepoReturnsAllocationWithStatusAndStartTime()
        {
            //Given

            var name = "test";
            var mobilePhone = "000";
            var phone = "";
            var street = "street";
            var streetnr = "01";
            var postalcode = "1234";
            var city = "kjhg";
            var licenseplate = "123";
            var country = "bel";
            var mail = "test@test.com";

            //When
            var newperson = new Person
            (
                name,
                mobilePhone,
                phone,
                new Address
                {
                    CityName = city,
                    PostalCode = postalcode,
                    StreetName = street,
                    StreetNumber = streetnr
                },
                mail,
                new LicensePlate(licenseplate, country)
            );

            var allocation = new Allocation()
            {
                ParkinglotId = 5,
                MemberPersonId = 1
            };

            var options = new DbContextOptionsBuilder<ParkSharkContext>()
                .UseInMemoryDatabase("parkshark" + Guid.NewGuid().ToString("n"))
                .Options;

            
            //When
            using (var context = new ParkSharkContext(options))
            {
                AllocationRepository allocationRepository = new AllocationRepository(context, _personRepository, _parkinglotRepository);
                _personRepository.GetById(1).Returns(newperson);
                _parkinglotRepository.GetOneParkinglot(5).Returns(new Parkinglot());
                var result = allocationRepository.SaveNewAllocation(allocation);
                //Then
                Assert.Equal(DateTime.Now.ToString("MM/dd/yyyy"), result.StartingTime.ToString("MM/dd/yyyy"));
                Assert.Equal("Active", result.Status.ToString());
            }
        }

        [Fact]
        public void GivenAnAllocation_WhenStopAllocation_ThenRepoReturnsAllocationWithStatusAndStartTime()
        {
            var allocation = new Allocation()
            {
                Id="1111",
                ParkinglotId = 5,
                MemberPersonId = 1,
            };

            var options = new DbContextOptionsBuilder<ParkSharkContext>()
                .UseInMemoryDatabase("parkshark" + Guid.NewGuid().ToString("n"))
                .Options;


            //When
            using (var context = new ParkSharkContext(options))
            {
                context.Add(allocation);
                context.SaveChanges();
                allocation.Status = StatusAllocation.Passive;
                AllocationRepository allocationRepository = new AllocationRepository(context, _personRepository, _parkinglotRepository);
                var result = allocationRepository.UpdateAllocation(allocation);
                //Then
                Assert.Equal("Passive", context.Allocations.SingleOrDefault(al => al.Id =="1111").Status.ToString());
            }
        }

    }
}
