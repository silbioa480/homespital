(function($) {

    var $window = $(window),
        $body = $('body'),
        $sidebar = $('#sidebar'),
        // $nav = $('#nav'),
        $wrapper = $('#wrapper');

    // sidebar.
    var $sidebar_a = $sidebar.find('a');

    $sidebar_a
        .addClass('scrolly')
        .on('click', function() {

            var $this = $(this);

            // External link? Bail.
            if ($this.attr('href').charAt(0) != '#')
                return;

            // Deactivate all links.
            $sidebar_a.removeClass('active');

            // Activate link *and* lock it (so Scrollex doesn't try to activate other links as we're scrolling to this one's section).
            $this.addClass('active').addClass('active-locked');

        })
        .each(function() {

            var	$this = $(this),
                id = $this.attr('href'),
                $section = $(id);

            // No section for this link? Bail.
            if ($section.length < 1)
                return;

            // Scrollex.
            $section.scrollex({
                mode: 'middle',
                top: '5vh',
                bottom: '5vh',
                initialize: function() {

                    // Deactivate section.
                    $section.addClass('inactive');

                },
                enter: function() {

                    // Activate section.
                    $section.removeClass('inactive');

                    // No locked links? Deactivate all links and activate this section's one.
                    if ($sidebar_a.filter('.active-locked').length == 0) {

                        $sidebar_a.removeClass('active');
                        $this.addClass('active');

                    }

                    // Otherwise, if this section's link is the one that's locked, unlock it.
                    else if ($this.hasClass('active-locked'))
                        $this.removeClass('active-locked');

                }
            });

        });

    // Scrolly.
    // $('.scrolly').scrolly({
    //     speed: 1000,
    //     offset: function() {
    //
    //         // if (breakpoints.active('<=medium'))
    //         //     return $titleBar.height();
    //
    //         return 0;
    //
    //     }
    // });

})(jQuery);