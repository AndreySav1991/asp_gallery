using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel;

namespace gallery.Models
{
    [MetadataType(typeof(PictureMetadata))]
    public partial class picture
    {
        [Bind(Exclude="id")]
        public class PictureMetadata
        {
            [ScaffoldColumn(false)]
            public int id { get; set; }

            [DisplayName("nazva")]
            [Required(ErrorMessage="Незаповнена назва")]
            [DisplayFormat(ConvertEmptyStringToNull=false)]
            [StringLength(50)]
            public string nazva { get; set; }

            [DisplayName("avtor")]
            [Required(ErrorMessage = "Незаповнений автор")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(50)]
            public string avtor { get; set; }

            [DisplayName("img")]
            [Required(ErrorMessage = "Нема адреси картинки")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(50)]
            public string img { get; set; }

            [DisplayName("price")]
            [DisplayFormat(DataFormatString="{0:F2}", ApplyFormatInEditMode=true)]
            [Required(ErrorMessage = "Незаповнена ціна")]
            [Range(0.01, 1000000000.09, ErrorMessage="Неправильний діапазон ціни" )]
            public decimal price { get; set; }






        }
    }

}