// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .
//= require jquery.infinitescroll

$(document).ready(function() {

  var height = $(window).height()
  $('#before-page').css('height', height);
  $('#before-page .tint').css('height', height);
  $('#before-page .tint').css('padding-top', height/10);
  $('#signup-section').css('margin-top', height/25);

  $('#login').on('click', function(event){

    $('.main-alert').hide();
    $('#signup-form').hide();
    $('#login-form').show();

  });

  $('#signup').on('click', function(event){

    $('.main-alert').hide();
    $('#login-form').hide();
    $('#signup-form').show();

  });

});
