//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require moment
//= require bootstrap-datetimepicker
//= require moment/fr
//= require jquery.slick
//= require_tree .

$(document).ready(function(){
  $('#order_delivery_date').datetimepicker({
  //   format: 'DD-MM-YYYY HH:mm',
  //   sideBySide: true,
  //   stepping: 15,
  //   showClose: true,
  //   toolbarPlacement: 'bottom',
  //   widgetPositioning: {
  //     horizontal: 'auto',
  //     vertical: 'auto'
  //   },
  //   icons: {
  //     close: 'glyphicon glyphicon-check'
  //   }
    inline: true,
    sideBySide: true,
    locale: 'fr'
  });

  $("#slick").slick({
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear'
  });

});

