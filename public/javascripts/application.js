// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  
  // $("select").uniform();
  $("select, input.q, input:checkbox, input:radio, input:file textarea").uniform();
  
});

function recieveBrowserState(state) {
  alert(state);
}