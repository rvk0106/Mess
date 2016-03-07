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
    $(document).ready(function () {
        $(document).on("scroll", onScroll);

        $('a[href^="#"]').on('click', function (e) {
            e.preventDefault();
            $(document).off("scroll");

            $('a').each(function () {
                $(this).removeClass('active');
            })
            $(this).addClass('active');

            var target = this.hash;
            $target = $(target);
            $('html, body').stop().animate({
                'scrollTop': $target.offset()
            }, 500, 'swing', function () {
                window.location.hash = target;
                $(document).on("scroll", onScroll);
            });
        });
    });

    function onScroll(event){
        var scrollPosition = $(document).scrollTop();
        $('nav a').each(function () {
            var currentLink = $(this);
            var refElement = $(currentLink.attr("href"));
            if (refElement.position() <= scrollPosition && refElement.position() + refElement.height() > scrollPosition) {
                $('nav ul li a').removeClass("active");
                currentLink.addClass("active");
            }
            else{
                currentLink.removeClass("active");
            }
        });
    }





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
