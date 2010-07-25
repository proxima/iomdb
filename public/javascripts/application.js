// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_non_header_rows(table)
{
  for(var i = table.rows.length; i > 1; i--) {
    table.deleteRow(i - 1);
  }
}
