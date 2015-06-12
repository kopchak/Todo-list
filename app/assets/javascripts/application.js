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
//   $('.general').on('click','.edit_project_img', function() {
//     $(this).parents(".project").find(".project_name").hide();
//     $(this).parents(".project_block").find(".project_input_text, .project_input_button").show();
//     return false;
//   });

//   $('.general').on('click','.edit_task_img_hover', function() {
//     $(this).parents(".task_block").find(".task_name_span, .task_date_span").hide();
//     $(this).parents(".task_block").find(".task_edit_text, .task_edit_date, .task_edit_button").show();
//     return false;
//   });

//   $('.general').on('click','.project_input_button', function() {
//     var id = $(this).parents(".project").attr("id");
//     var title = $(this).parents(".project_block").find(".project_input_text").val();
//     var path = "projects/" + id;
//    $.ajax({
//       type: "patch",
//       url: path,
//       data: {"project[title]":title}
//     });
//    $(this).parents(".project").find(".project_name").text(title);
//    $(this).parents(".project").find(".project_name").show();
//    $(this).parents(".project_block").find(".project_input_text, .project_input_button").hide();
//    return false;
//   });

  // $('.delete_project_img').bind('ajax:success', function() {
  //   $(this).parents('.project').remove();
  // });
  // $('.general').on('click','.delete_project_img', function() {
  //   var id = $(this).parents(".project").attr("id");
  //   var path = "projects/" + id;
  //  $.ajax({
  //     type: "delete",
  //     url: path,
  //     data: {"project[id]":id}
  //   });
  //  $(this).parents(".project").remove();
  //  return false;
  // });

  // $('.general').on('change','.checkbox', function() {
  //   var idProject = $(this).parents(".project").attr("id");
  //   var idTask = $(this).parents(".task_block").attr("id");
  //   var status = $(this).parents(".task_block").find(".checkbox").prop("checked");
  //   var path = "projects/" + idProject + "/tasks/" + idTask;
  //   $.ajax({
  //     type: "put",
  //     url: path,
  //     data: {"task[status]":status}
  //   });
  //   console.log(status);
  //   // $(this).parents(".task_block").find(".checkbox").attr("checked");
  //   return false;
  // });

  // $('.general').on('click','.task_edit_button', function() {
  //   var idProject = $(this).parents(".project").attr("id");
  //   var idTask = $(this).parents(".project").find(".task_block").attr("id");
  //   var title = $(this).parents(".task_name").find(".task_edit_text").val();
  //   var date = $(this).parents(".task_name").find(".task_edit_date").val();
  //   var path = "projects/" + idProject + "/tasks/" + idTask;
  //  $.ajax({
  //     type: "patch",
  //     url: path,
  //     data: {"task[title]":title, "task[date]":date}
  //   });
  //   $(this).parents(".task_name").find(".task_name_span").text(title);
  //   $(this).parents(".task_name").find(".task_date_span").text("deadline: " + date);
  //   $(this).parents(".task_name").find(".task_edit_text, .task_edit_date, .task_edit_button").hide();
  //   $(this).parents(".task_name").find(".task_name_span, .task_date_span").show();
  //  return false;
  // });

  // $('.general').on('click','.delete_task_img_hover', function() {
  //   var idProject = $(this).parents(".project").attr("id");
  //   var idTask = $(this).parents(".task_block").attr("id");
  //   var path = "projects/" + idProject + "/tasks/" + idTask;
  //   $.ajax({
  //     type: "delete",
  //     url: path,
  //     data: {"task[id]":idTask}
  //   });
  //  $(this).parents(".task_block").remove();    
  //  return false;
  // });

  // $('.general').on('click','.task_input_button', function() {
  //   var idProject = $(this).parents(".project").attr("id");
  //   var title = $(this).parents(".add_task_block").find(".task_input_text").val();
  //   var date = $(this).parents(".add_task_block").find(".task_input_date").val();
  //   var path = "projects/" + idProject + "/tasks";
  //   var idTask;
  //   $.ajax({
  //     async: false,
  //     type: "post",
  //     url: path,
  //     data: {"task[title]":title, "task[date]":date},
  //     success: function(data) { idTask = data }
  //   });
  //   $(this).parents('.project').children("ul").append(
  //     "<li class='task_block' id="+ idTask +">" +
  //       "<div class='task_status'>" +
  //         "<input type='checkbox' name='' id='' value='' class='checkbox'>" +
  //       "</div>" +
  //       "<div class='task_name'>" +
  //         "<span class='task_name_span'>"+ title +"</span><span class='task_date_span'>deadline: "+ date +"</span>" +
  //         "<input type='text' class='task_edit_text' placeholder='Set a new name for "+ title +"' size='30'>" +
  //         "<input type='date' class='task_edit_date'>" +
  //         "<input type ='button' class ='task_edit_button' value = 'OK'>" +
  //       "</div>" +
  //       "<div class='task_toolbar'>" +
  //         "<input type='image' src='/assets/leaf.png'>" +
  //         "<input type='image' src='/assets/2.png'>" +
  //         "<input type='image' class='edit_task_img_hover' src='/assets/edit_task.png'>" +
  //         "<input type='image' src='/assets/2.png'>" +
  //         "<input type='image' class='delete_task_img_hover' src='/assets/del_task.png'>" +
  //       "</div>" +
  //     "</li>");
  //   $(this).parents(".add_task_block").find(".task_input_text, .task_input_date").val('');
  //  return false;
  // });

  $('.general').on('click','.create_todolist', function() {
    $(this).parent('.general').find(".new_project").show();
    return false;
  });

  // $(".task_list").sortable({
  //   axis: 'y',
  //   items: 'li',
  //   cursor: 'move',
  //   update: function() {
  //     var idProject = $(this).parents(".project").attr("id");
  //     var tasks = $(this).sortable("toArray").toString();
  //     var path = '/projects/'+ idProject +'/tasks/sorting'
  //     $.ajax({
  //     type: "post",
  //     data: {"task":tasks},
  //     url: path
  //     });
  //   }
  // });
  

});