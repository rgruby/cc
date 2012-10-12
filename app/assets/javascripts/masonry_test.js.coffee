//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded
//= require masonry/jquery.infinitescroll.min
jQuery ->
  $container = $('#masonry');
  $container.imagesLoaded ->
    $container.masonry
      itemSelector : '.masonryBox',
      columnWidth : 300