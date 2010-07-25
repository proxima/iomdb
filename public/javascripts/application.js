// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_non_header_rows(table)
{
  var t = document.getElementById(table);
  for(var i = t.rows.length; i > 1; i--) {
    t.deleteRow(i - 1);
  }
}
