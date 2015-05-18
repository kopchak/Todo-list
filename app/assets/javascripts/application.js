// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
    $('.header').on('click','.edit_proj_img', function() {
        $(this).parents(".project").find(".project_name").hide();
        $(this).parents(".header_top").find(".edit_project").show();
        return false;
    });
});

$(document).ready(function(){
    $('.header').on('click','.edit_task_img_hover', function() {
        $(this).parents(".task_line").find(".name_task_span").hide();
        $(this).parents(".task_line").find(".edit_task").show();
        return false;
    });
});