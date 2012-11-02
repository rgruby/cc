# Pagination
# javascript support for forward/back buttons when using simple paging, i.e., not infinite scroll.
if (history && history.pushState) 
	jQuery ->
	  jQuery(".pagination a").live "click", -> 
	    jQuery(".pagination").html "Loading..."
	    jQuery.getScript this.href
	    history.pushState(null, document.title, this.href);
	    false

	  jQuery(window).bind "popstate", ->
	    jQuery.getScript location.href