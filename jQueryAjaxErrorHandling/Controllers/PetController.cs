
using System.Collections.Generic;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using jQueryAjax.Models;

namespace jQueryAjax.Controllers
{
    public class PetController : Controller
    {
        public ActionResult Index()
        {
            var pets = new List<PetViewModel> {
                new PetViewModel { Name = "Fluffy", Color = "White", Age = 4},
                new PetViewModel { Name = "Midnight", Color = "Black", Age = 7}
            };

            return View(pets);
        }

        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult Create()
        {
            var viewModel = new PetViewModel
            {
                PetTypes = new List<PetTypeViewModel>
                {
                    new PetTypeViewModel {Id = 0, Name = "Cat"},
                    new PetTypeViewModel {Id = 1, Name = "Dog"},
                    new PetTypeViewModel {Id = 2, Name = "Ferret"}
                } 
            };

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Create(PetViewModel pet, FormCollection collection)
        {
            try
            {
                Thread.Sleep(5000);

                //var ajaxResponse = new
                //{
                //    Success = false,
                //    Message = "Your program really blew chunks this time!"
                //};
                //Response.StatusCode = (int) System.Net.HttpStatusCode.BadRequest;
                //return Json(ajaxResponse, JsonRequestBehavior.AllowGet);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Edit()
        {
            var viewModel = new PetViewModel
            {
                Name = "Fred",
                Color = "Brownish Grey",
                Age = 1,
                Adopted = true,
                PetType = new PetTypeViewModel {Id = 2, Name = "Ferret"},
                PetTypes = new List<PetTypeViewModel>
                {
                    new PetTypeViewModel {Id = 0, Name = "Cat"},
                    new PetTypeViewModel {Id = 1, Name = "Dog"},
                    new PetTypeViewModel {Id = 2, Name = "Ferret"}
                }
            };

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Edit(PetViewModel pet, FormCollection collection)
        {
            try
            {
                Thread.Sleep(5000);
                
                var success = pet.Adopted;
                var ajaxResponse = new AjaxResponseViewModel
                {
                    Success = success,
                    Messages = new List<AjaxMessageViewModel>()
                };

                if (success)
                {
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "DEBUG", Message = "Success: All is good ;)" });
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "FRIENDLY", Message = string.Format("{0} has been updated", pet.Name) });
                }
                else
                {
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "DEBUG", Message = "Error: Detailed programmatic error..." });
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "FRIENDLY", Message = string.Format("Unable to update {0}", pet.Name) });
                }
                //Response.StatusCode = (int) System.Net.HttpStatusCode.BadRequest;
                return Json(ajaxResponse, JsonRequestBehavior.AllowGet);

                //return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Update()
        {
            var viewModel = new PetViewModel
            {
                Name = "Fred",
                Color = "Brownish Grey",
                Age = 1,
                Adopted = true,
                PetType = new PetTypeViewModel { Id = 2, Name = "Ferret" },
                PetTypes = new List<PetTypeViewModel>
                {
                    new PetTypeViewModel {Id = 0, Name = "Cat"},
                    new PetTypeViewModel {Id = 1, Name = "Dog"},
                    new PetTypeViewModel {Id = 2, Name = "Ferret"}
                }
            };

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Update(PetViewModel pet, FormCollection collection)
        {
            try
            {
                Thread.Sleep(5000);

                var success = pet.Adopted;
                var ajaxResponse = new AjaxResponseViewModel
                {
                    Success = success,
                    Messages = new List<AjaxMessageViewModel>()
                };

                if (success)
                {
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "DEBUG", Message = "Success: All is good ;)" });
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "FRIENDLY", Message = string.Format("{0} has been updated", pet.Name) });
                }
                else
                {
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "DEBUG", Message = "Error: Detailed programmatic error..." });
                    ajaxResponse.Messages.Add(new AjaxMessageViewModel { Code = "FRIENDLY", Message = string.Format("Unable to update {0}", pet.Name) });
                }
                //Response.StatusCode = (int) System.Net.HttpStatusCode.BadRequest;
                //return Json(ajaxResponse, JsonRequestBehavior.AllowGet);
                return View("Details");

                //return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Param(FormCollection formCollection)
        {
            var dummy = string.Empty;

            return View();
        }
    }
}
