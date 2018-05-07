document.addEventListener("turbolinks:load", function() {

  if (document.getElementById('see_options')) {

    console.log("i see you");
    var seeOptions = document.getElementById('see_options');
    console.log(seeOptions);

    seeOptions.addEventListener('submit', function(e) {

    });

  }

});
