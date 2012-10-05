//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded
jQuery ->
  $container = $('#masonry');
  $container.imagesLoaded ->
    $container.masonry
      itemSelector : '.masonryImage'