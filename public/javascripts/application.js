// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_non_header_rows(table)
{
  var t = document.getElementById(table);
  for(var i = t.rows.length; i > 1; i--) {
    t.deleteRow(i - 1);
  }
}

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-19949951-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
