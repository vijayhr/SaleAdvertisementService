// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
jQuery(document).ready(function () {
    jQuery(document).delegate('#search-button','click', function (event) {
        jQuery.ajax({
            type: 'get',
            url: 'items/search_by_title',
            data: "search="+jQuery('#search-textbox').val(),
            success: function(response){
                jQuery('#content').html(response);
            }
        });
    });
});