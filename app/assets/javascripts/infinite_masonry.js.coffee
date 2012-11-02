//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded
//= require masonry/jquery.infinitescroll.min
jQuery ->
  $container = $('#masonry')
  $container.imagesLoaded ->
    $container.masonry
      itemSelector : '.masonryBox',
      columnWidth : 300

  $container.infinitescroll(
    {
      navSelector  : 'ul.endless-pagination',
      nextSelector : 'ul.endless-pagination li.next_page a:first',
      itemSelector : 'div.masonryBox',
      debug : true,
    },
    # trigger Masonry as an infinitescroll callback
    (newElements) ->
      # hide new items while they are loading
      $newElems = $(newElements).css({ opacity: 0 });
      # ensure that images load before adding to masonry layout
      $newElems.imagesLoaded ->
        # show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true );
  )