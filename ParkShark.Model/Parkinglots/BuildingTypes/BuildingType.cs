﻿using System;
using System.Collections.Generic;
using System.Text;
using ParkShark.Infrastructure.Exceptions;

namespace ParkShark.Model.Parkinglots.BuildingTypes
{
    public class BuildingType:ModelCreationCheckClass
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public void CheckValues()
        {
            CheckFilledIn(Name, "Name", this);
        }
    }
}
