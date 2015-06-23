# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
 $("#posts-list").infinitescroll
    navSelector: "ul.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "ul.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "ul#posts-list" # selector for all items you'll retrieve
