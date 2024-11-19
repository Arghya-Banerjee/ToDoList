using Core;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using ToDoList.Models;

namespace ToDoList.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            TaskModel obj = new TaskModel();
            obj.Opmode = 0;
            List<TaskModel> tasklist = new List<TaskModel>();
            tasklist = DBOperations<TaskModel>.GetAllOrByRange(obj, Constant.usp_taskMaster);
            return View(tasklist);
        }

        public IActionResult AddTaskPage()
        {
            return View();
        }

        public IActionResult AddTask(TaskModel obj)
        {
            obj.Opmode = 1;
            int res = 0;
            res = DBOperations<TaskModel>.DMLOperation(obj, Constant.usp_taskMaster);

            return RedirectToAction("Index");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
