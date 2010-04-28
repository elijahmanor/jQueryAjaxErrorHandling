
using System.Collections.Generic;
using System.ComponentModel;

namespace jQueryAjax.Models
{
    public class PetViewModel
    {
        public string Name { get; set; }
        public string Color { get; set; }
        public int Age { get; set; }
        [DisplayName("Type")]
        public PetTypeViewModel PetType { get; set; }
        public List<PetTypeViewModel> PetTypes { get; set; }
        public bool Adopted { get; set; }
    }
}