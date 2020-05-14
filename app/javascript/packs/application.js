// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//= require jquery
//= require popper
//= require bootstrap-sprockets



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'


$('#login_main').on('shown.bs.modal', function () {
    $('#email').trigger('focus')
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = 'user '
    var modal = $(this)
    modal.find('.modal-title').text('Login ' + recipient)
    modal.find('.modal-body input').val(recipient)
})

