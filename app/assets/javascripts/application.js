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
//= require jquery.sortable
//= require_tree .
//= require jquery-ui

$(document).ready(function(){
  $('.general').on('click','.edit_project_img', function() {
    $(this).parents(".project").find(".project_name").hide();
    $(this).parents(".project_block").find(".project_input_text, .project_input_button").show();
    return false;
  });

  $('.general').on('click','.edit_task_img_hover', function() {
    $(this).parents(".task_block").find(".task_name_span, .task_date_span").hide();
    $(this).parents(".task_block").find(".task_edit_text, .task_edit_date, .task_edit_button").show();
    return false;
  });

  $('.general').on('click','.create_todolist', function() {
    $(this).parent('.general').find(".new_project").show();
    return false;
  });

  $('.general').on('change','.checkbox', function() {
    var idProject = $(this).parents(".project").attr("id");
    var idTask = $(this).parents(".task_block").attr("id");
    var status = $(this).parents(".task_block").find(".checkbox").prop("checked");
    var path = "projects/" + idProject + "/tasks/" + idTask;
    $.ajax({
      type: "put",
      url: path,
      data: {"task[status]":status}
    });
    return false;
  });  

  $(".task_list").sortable({
    items: 'li',
    cursor: 'move',
    update: function() {
      var idProject = $(this).parents(".project").attr("id");
      var tasks = $(this).sortable("toArray").toString();
      var path = '/projects/'+ idProject +'/tasks/sorting'
      $.ajax({
      type: "post",
      data: {"task":tasks},
      url: path
      });
    }
  });
});