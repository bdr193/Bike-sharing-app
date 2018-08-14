//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require bootstrap-datepicker
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require underscore
//= require gmaps/google
//= require_tree .

$('.datepicker').datepicker({
  format: 'yyyy-mm-dd',
  autoclose: true,
  todayHighlight: true,
  startDate: new Date(),
});
