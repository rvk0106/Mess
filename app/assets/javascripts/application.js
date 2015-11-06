// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrapValidator.min


$(function(){
    $.scrollIt();
    $( "#semister_university" ).change(function() {
        $.ajax({
            url: "/get_university_courses/"+$(this).val()
        }).done(function(data){
            $("#semister_course_id").empty().append(data);
        });
    });
    $( "#subject_university" ).change(function() {
        $.ajax({
            url: "/get_university_courses/"+$(this).val()
        }).done(function(data){
            $("#subject_course").empty().append(data);
        });
    });
    $( "#subject_course" ).change(function() {
        $.ajax({
            url: "/get_course_semisters/"+$(this).val()
        }).done(function(data){
            $("#subject_semister_id").empty().append(data);
        });
    });
    $( "#user_university" ).change(function() {
        $.ajax({
            url: "/get_university_courses/"+$(this).val()
        }).done(function(data){
            $("#user_course").empty().append(data);
        });
    });
    $( "#user_course" ).change(function() {
        $.ajax({
            url: "/get_semister_subject_checkbox/"+$(this).val()
        }).done(function(data){

            $(".semister_subjects").html(data);
           // $("#subject_semister_id").empty().append(data);
        });
    });
    $(".close-class").click(function(){
       $(".close-div").hide()
    });
});
function openRegisterform(get_class)
{
    $('.bgregister').hide();
	$(get_class).show();

	return false;
}
