# Pagination
if (history && history.pushState) 
	jQuery ->
	  jQuery(".pagination a").live "click", -> 
	    jQuery(".pagination").html "Loading..."
	    jQuery.getScript this.href
	    history.pushState(null, document.title, this.href);
	    false

	  jQuery(window).bind "popstate", ->
	    jQuery.getScript location.href

# Endless page
jQuery ->
  if $('.endless-pagination').length
    $(window).scroll ->
      url = $('.endless-pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.endless-pagination').text("Fetching more...")
        $.getScript(url)
    $(window).scroll()