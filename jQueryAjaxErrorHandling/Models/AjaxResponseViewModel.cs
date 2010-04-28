
using System.Collections.Generic;

namespace jQueryAjax.Models
{
    public class AjaxResponseViewModel
    {
        public bool Success { get; set; }
        public List<AjaxMessageViewModel> Messages { get; set; }
    }
}