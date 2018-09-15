﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region additional namespaces
using Chinook.Data.Entities;
using ChinookSystem.DAL;

#endregion


namespace ChinookSystem.BLL
{
    [DataObject]
    public class AlbumController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Album> Album_List()
        {
            using (var context = new ChinookContext())
            {
                return context.Albums.ToList();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public Album Album_Find(int albumid)
        {
            using (var context = new ChinookContext())
            {
                return context.Albums.Find(albumid);
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Album> Album_GetByArtistId(int artistid)
        {
            using (var context = new ChinookContext())
            {
                var results = from aRowOn in context.Albums
                              where aRowOn.ArtistID.Equals(artistid)
                              select aRowOn;
                return results.ToList();

            }
        }

    }
}
