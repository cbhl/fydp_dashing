class Dashing.Buildtrigger extends Dashing.Widget
    ready: ->
        $("#trigger-full-build").on("click", ->
            $.get("http://cryptkeeper-build.rosemary.home.myazuresky.com/trigger_build/lgkmGKfwyArYkONrLYo7bI7RgefbQRh2?kernel_full=true&userspace=true&run_tests=true")
        )
        $("#trigger-incremental-build").on("click", ->
            $.get("http://cryptkeeper-build.rosemary.home.myazuresky.com/trigger_build/lgkmGKfwyArYkONrLYo7bI7RgefbQRh2?kernel_incremental=true&userspace=true&run_tests=true")
        )
