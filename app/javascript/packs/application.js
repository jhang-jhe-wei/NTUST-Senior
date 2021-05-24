// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

/* kamiliff default behavior */
window.addEventListener("liff_ready", function(event){
    register_kamiliff_submit();
  });
  
  window.addEventListener("liff_submit", function(event){
    var json = JSON.stringify(event.detail.data);
    var url = event.detail.url;
    var method = event.detail.method;
    var request_text = method + " " + url + "\n" + json;
    liff_send_text_message(request_text);
  });
  