// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker.min
//= require chosen.jquery.min
//= require website/jquery.easing.1.3
//= require website/camera.min
//= require turbolinks

$('document').ready(function(){
  $('input[data-behaviour*=datepicker]').datepicker({autoclose:true}).next().on('click', function(){
    $(this).prev().focus();
  });

//     $('.time-picker').timepicker();

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'Không tìm thấy kết quả',
  })
})

