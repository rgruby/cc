# Endless page
# Simple infinite scroll implementation.  Paul Irish has a jQuery plug-in which is more deluxe.
jQuery ->
  if $('.endless-pagination').length
    $(window).scroll ->
      url = $('.endless-pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.endless-pagination').text("Fetching more...")
        $.getScript(url)
    $(window).scroll()