if (history && history.pushState) 
	jQuery ->
	  jQuery(".pagination a").live "click", -> 
	    jQuery(".pagination").html "Loading..."
	    jQuery.getScript this.href
	    history.pushState(null, document.title, this.href);
	    false

	  jQuery(window).bind "popstate", ->
	    jQuery.getScript location.href