$(document).ready(function(){
  $.facebox.settings.closeImage = 'http://assets.teamon.eu/facebox/closelabel.png'
  $.facebox.settings.loadingImage = 'http://assets.teamon.eu/facebox/loading.gif'
  
  $(".entry .wrap").append($("<a href='#'>edit</a>").click(function(){
    jQuery.facebox("dupa");
    return false;
  }).hide()).hover(function(){
    $(this).find("a").show()
  }, function(){
    $(this).find("a").hide()
  })
})
