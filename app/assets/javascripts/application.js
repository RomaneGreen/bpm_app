//= require jquery3
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ 
    // polyfill for jquery 3 - see https://stackoverflow.com/a/41262100
    jQuery.fn.load = function(callback){ $(window).on("load", callback) };
    $(document).foundation(); 
  });