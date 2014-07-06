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
//= require website/jquery.price.min

$('document').ready(function(){
  $('input[data-behaviour*=datepicker]').datepicker({autoclose:true}).next().on('click', function(){
    $(this).prev().focus();
  });

  $('input[data-behaviour*=dp_multichoice]').datepicker({multidate: true,multidateSeparator: ';'});

//     $('.time-picker').timepicker();

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'Không tìm thấy kết quả',
  });
  var ticket_sale = [];
  $('.can_book_bed').click(function(){

    if($(this).hasClass('current_book_bed')){
      var index = ticket_sale.indexOf($(this).attr('data-ticket'));
      if (index > -1) {
          ticket_sale.splice(index, 1);
      }
      $(this).removeClass('current_book_bed');
    }else{
      $(this).addClass('current_book_bed');
      ticket_sale.push($(this).attr('data-ticket'));
    }
    $('.ticket_quantity').html($('.current_book_bed').length)
    var price = $('.total').attr('data-price') * $('.current_book_bed').length;
    $('.total').html(price).priceFormat({
      prefix: '',
      thousandsSeparator: ',',
      centsLimit: 0
    });
    $("#ticket_ticket_sale").val(ticket_sale.join());
    $('.tickets').text(ticket_sale.join());
  })
})

