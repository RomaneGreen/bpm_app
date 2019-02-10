// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ 
  // polyfill for jquery 3 - see https://stackoverflow.com/a/41262100
  jQuery.fn.load = function(callback){ $(window).on("load", callback) };
  $(document).foundation(); 
});

Date.prototype.formatted = function() {
  var m = this.getMonth() + 1;
  var d = this.getDate();
  return [this.getFullYear(), (m > 9 ? '' : '0') + m, (d > 9 ? '' : '0') + d].join('-');
};

function getFormData(array) {
  var data = {};
  $.each(array, function (k, v) {
    data[v.name] = v.value;
  });
  return data;
}