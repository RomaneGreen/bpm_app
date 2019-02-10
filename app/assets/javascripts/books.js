$(document.forms[0]).submit(function (e) {
  var formData = getFormData($(this).serializeArray());
  var dateRegex = /^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$/;
  var priceRegex = /^\d+(\.\d+)?$/;
  if (!formData.release_date.match(dateRegex)) {
    e.preventDefault();
    e.stopPropagation();  
    var today = new Date();
    alert ("Please use this format for the release date: " + today.formatted());
    $("#release_date").focus();
  }
  if (formData.base_price && !formData.base_price.match(priceRegex)) {
    e.preventDefault();
    e.stopPropagation();
    alert("Please enter only numbers (with an optional decimal point) for the base price.");
    $("#base_price").focus();
  }
});
