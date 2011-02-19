$(document).ready(function(){
  $.facebox.settings.closeImage = 'http://assets.teamon.eu/facebox/closelabel.png'
  $.facebox.settings.loadingImage = 'http://assets.teamon.eu/facebox/loading.gif'
  
  $(".entry .wrap").hover(function(){
    $(this).find("a").show()
  }, function(){
    $(this).find("a").hide()
  })
  
  $(".entry .wrap a").hide();
  $("a[rel=facebox]").facebox();
  
  $("#facebox form").live("ajax:success", function(ev, data, status, xhr){
    var notice = $(this).children(".form-notice")
    if(notice.size() == 0){
      notice = $("<div class='form-notice'></div>");
      $(this).prepend(notice);
    }
    notice.text(data.notice).show();
    setTimeout(function(){ notice.slideUp() }, 1500);
  })
  
  $("#facebox form").live("ajax:error", function(ev, xhr, status){
    console.log($.parseJSON(xhr.responseText))
    var errors = $(this).children(".form-errors")
    if(errors.size() == 0){
      errors = $("<ul class='form-errors'></ul>");
      $(this).prepend(errors);
    }
    
    errors.html("")
    data = $.parseJSON(xhr.responseText);
    for(key in data){
      errors.append("<li>" + key + " " + data[key] + "</li>")
    }
    
    errors.show();
    setTimeout(function(){ errors.slideUp() }, 1500);
  })
  
  $("#facebox form a.cancel").live("click", function(){
    $("#facebox a.close").click()
    return false
  })
})


