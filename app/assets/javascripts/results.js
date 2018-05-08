document.addEventListener("turbolinks:load", function() {

  if (document.getElementById('see_options')) {

    var resultsDiv = document.querySelector('#coverage_results_container');

// new_trip is an id on the entire form, allows params to pass through
    function searchPolicies(e) {
      e.preventDefault();
      e.stopPropagation();
      $.ajax({
        url: '/policies/search_policies',
        method: 'post',
        dataType: 'html',
        data: $(new_trip).serialize()
      })
      .done(function(responseData) {
        console.log('works search!');
        resultsDiv.innerHTML = responseData;

      })
      .fail(ajaxFails)
    }

    function ajaxFails() {
      console.log('Error');
    }

// This does the actual search
    new_trip.addEventListener('submit', searchPolicies)



// Maybe dont need this?
    // var seeOptions = document.querySelector('#see_options');

    //
    // seeOptions.addEventListener('submit', function(e) {
    //   e.preventDefault();
    //   console.log("is this working");
    //
    //   $.ajax({
    //     url: '/policies/find_policies',
    //     method: 'get',
    //     dataType: 'html'
    //   })
    //   .done(function(responseData) {
    //     console.log("works!");
    //     resultsDiv.innerHTML = responseData;
    //   })
    // });

  }
});
