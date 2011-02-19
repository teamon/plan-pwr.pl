var Epure = {
  reload: function(){
    $("#schedule-overlay").show()
    $.get(document.location.href, {}, function(data){
      $("#schedule-wrap").html(data)
      $("#schedule-overlay").hide()
    })
  },
  
  showNotice: function(msg){
    var form = $("#facebox form")
    form.children(".form-errors").hide()
    var notice = $(form).children(".form-notice")
    if(notice.size() == 0){
      notice = $("<div class='form-notice'></div>");
      form.prepend(notice);
    }
    notice.text(msg).show();
    setTimeout(function(){ notice.slideUp() }, 1500);
  }
}

$(document).ready(function(){
  $.facebox.settings.closeImage = 'http://assets.teamon.eu/facebox/closelabel.png'
  $.facebox.settings.loadingImage = 'http://assets.teamon.eu/facebox/loading.gif'
  
  $("a[rel=facebox]").livequery(function(){
    $(this).facebox();
  });
  
  $("#facebox form").live("ajax:success", function(ev, data, status, xhr){
    Epure.showNotice(data.notice)
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
  })
  
  $("#facebox form a.cancel").live("click", function(){
    jQuery(document).trigger('close.facebox');
    return false
  })
  
  $("form.edit_entry").live("ajax:success", function(){
    Epure.reload();
  });
  
  $("form.new_entry").live("ajax:success", function(ev, data, status, xhr){
    Epure.reload();
    jQuery.facebox({ ajax: data.edit_path });
    var self = this
    var msg = data.notice
    $(document).bind('reveal.facebox', function(){
      Epure.showNotice(msg);
      $(document).unbind("reveal.facebox");
    })
  });
  
  $("#facebox a.delete").live("click", function(){
    jQuery(document).trigger('close.facebox');
  })
  
  
})


