$(window).on('scroll', function () {
    if ($(window).scrollTop()) {
        $('#navbar').removeClass('nav-down').addClass('nav-up');
    } else {
        $('#navbar').addClass('nav-down').removeClass('nav-up');
    }
});

$('#navbar>.container-fluid>.navbar-toggler').bind("click", function () {
    if ($('#navbar').hasClass('nav-up'))
        $('#navbar').addClass('nav-down').removeClass('nav-up');
    else $('#navbar').removeClass('nav-down').addClass('nav-up');
    // $('#navbar').addClass('nav-down').removeClass('nav-up');
})