// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "./@hotwired/turbo-rails"
import "./controllers"
import "./menu"
import Rails from "/@rails/ujs"

// Start Rails UJS
Rails.start()

import { Turbo } from "/@hotwired/turbo-rails"
window.Turbo = Turbo

// Import your custom JavaScript
import "./custom";
