// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Import Turbo
import { Turbo } from "../node_modules/@hotwired/turbo-rails";
window.Turbo = Turbo;

// Import Rails UJS
import Rails from "@rails/ujs";

// Start Rails UJS
Rails.start();

// Import your custom JavaScript
import "controllers";
import "menu";
import "./custom";
