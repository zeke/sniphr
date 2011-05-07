// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  
  // $("select").uniform();
  $("select, input.q, input:checkbox, input:radio, input:file textarea").uniform();
  
  // create a convenient toggleLoading function
  // var toggleLoading = function() { $("#loading").toggle() };

  $("a.delete")
    // .live("ajax:loading", function() { alert('loading'); })
    // .live("ajax:complete", function() { alert('complete'); })
    .live("ajax:success", function(event, data, status, xhr) {
      var response = JSON.parse(xhr.responseText);
      if (response.sniph) {
        $('#sniph_'+response.sniph.id).slideUp();
        // Decrement count in heading
        var new_heading_html = $('h1').html().replace(/(\d+)/, function(wholeMatch, count) { return parseInt(count, 10)-1; });
        $('h1').html(new_heading_html);
      } else {
        alert(response);
      }
    });
      
});

function recieveBrowserState(state) {
  alert(state);
}