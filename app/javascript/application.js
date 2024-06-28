// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "menu"
import "simple_calendar";

import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

document.addEventListener("DOMContentLoaded", function() {
  flatpickr(".datetimepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
});