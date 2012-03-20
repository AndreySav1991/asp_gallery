using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel;

namespace gallery.Models
{
    [MetadataType(typeof(QuesMetadata))]
    public partial class ques
    {

        [Bind(Exclude = "id")]
        public class QuesMetadata
        {
            [ScaffoldColumn(false)]
            public int id { get; set; }

            [DisplayName("name")]
            [Required(ErrorMessage = "Немає імені")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(50)]
            public string name { get; set; }

            [DisplayName("email")]
            [Required(ErrorMessage = "Введіть пошту")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(50)]
            public string email { get; set; }

            [DisplayName("question")]
            [Required(ErrorMessage = "Нема питання")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(50)]
            public string question { get; set; }

        }
    }
}