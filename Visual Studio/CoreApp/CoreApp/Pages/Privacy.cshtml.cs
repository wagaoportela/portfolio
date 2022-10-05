﻿using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Globalization;

namespace CoreApp.Pages
{
    public class PrivacyModel : PageModel
    {
        private readonly ILogger<PrivacyModel> _logger;

        public PrivacyModel(ILogger<PrivacyModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
            string datetime = DateTime.Now.ToString("d", new CultureInfo("pt-BR"));
            ViewData["TimeStamp"] = datetime;
        }
    }
}