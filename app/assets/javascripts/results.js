document.addEventListener("turbolinks:load", function() {

  if (document.getElementById('see_options')) {

    var seeOptions = document.querySelector('#see_options');
    var resultsDiv = document.querySelector('#coverage_results_container');

    seeOptions.addEventListener('click', function(e) {
      e.preventDefault();
      console.log("is this working");

      $.ajax({
        url: '/policies/find_policies',
        method: 'get',
        dataType: 'html',
        data: $(this).serialize()
      })
      .done(function(responseData) {
        console.log("works!");
        resultsDiv.innerHTML = responseData;
      })



    });

  }

});
