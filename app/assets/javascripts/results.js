document.addEventListener("turbolinks:load", function() {

  if (document.getElementById('see_options')) {

    console.log("i see you");
    var seeOptions = document.querySelector('#see_options');

    seeOptions.addEventListener('click', function(e) {
      e.preventDefault();
      console.log("is this working");
    });

  }

});
