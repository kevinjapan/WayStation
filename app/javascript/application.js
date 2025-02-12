// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"


// our HelperJS custom lib
import * as HelperJS from "/helper_js.js"
export { HelperJS }
window.HelperJS = HelperJS