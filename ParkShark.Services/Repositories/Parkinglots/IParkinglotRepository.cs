﻿using System;
using System.Collections.Generic;
using System.Text;
using ParkShark.Model.Parkinglots;

namespace ParkShark.Services.Repositories.Parkinglots
{
    public interface IParkinglotRepository
    {
        bool SaveNewParkinglot(Parkinglot parkinglot);
        List<Parkinglot> GetAllParkinglots();
        Parkinglot GetOneParkinglot(int id);
        bool UpdateParkinglot(Parkinglot parkinglot);
    }
}
