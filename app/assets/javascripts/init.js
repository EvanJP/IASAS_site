(function($){
  $(function(){
    $('.button-collapse').sideNav();
    $(".dropdown-button").dropdown();
    $('ul.tabs').tabs();
    $('.collapsible').collapsible({
        accordion : false
    });
    $('.slider').slider({full_width: true});
    $('.modal-trigger').leanModal();
  }); // end of document ready
})(jQuery); // end of jQuery name spaces