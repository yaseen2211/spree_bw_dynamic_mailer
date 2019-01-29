// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'
//= require ckeditor/init

$(document).ready(function()
{
  var navItems = $('.admin-menu li > a');
  var navListItems = $('.admin-menu li');
  var allWells = $('.admin-content');
  var allWellsExceptFirst = $('.admin-content:not(:first)');
  
  allWellsExceptFirst.hide();
  navItems.click(function(e)
  {
      e.preventDefault();
      navListItems.removeClass('active');
      $(this).closest('li').addClass('active');
      
      allWells.hide();
      var target = $(this).attr('data-target-id');
      $('#' + target).show();
  });
});