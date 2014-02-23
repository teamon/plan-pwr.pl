var Epure = {
  reload: function(){
    $("#schedule-overlay").show()
    $.get(document.location.href, {}, function(data){
      $("#schedule-wrap").html(data)
      $("#schedule-overlay").hide()
    })
  },
  
  showNotice: function(msg){
    if(msg == undefined) return; 
    var form = $("#facebox form")
    form.children(".form-errors").hide()
    var notice = $(form).children(".form-notice")
    if(notice.size() == 0){
      notice = $("<div class='form-notice'></div>");
      form.prepend(notice);
    }
    notice.text(msg).show();
    setTimeout(function(){ notice.fadeOut() }, 1500);
  }
}

tr = '<tr>\
        <td class="name"><a href="#">X</a> <input type="text" value="" /></td>\
        <td class="ects"><input type="text" value="" /></td>\
        <td class="grade"><input type="text" value="" /></td>\
</tr>'

function calculate(){
  $("#avg table").each(function(){
    ects_sum = 0.0
    grade_sum = 0.0

    trs = $(this).find("tr")
    for(i=1; i<trs.length; i++){
      ects = parseInt($(trs[i]).find("td.ects input").val())
      grade = parseFloat($(trs[i]).find("td.grade input").val())
      ects_sum += ects
      grade_sum += ects * grade
    }

    console.log(grade_sum)
    console.log(ects_sum)
      avg = Math.round((grade_sum / ects_sum) * 100)/100
      avg3 = Math.round((grade_sum / ects_sum) * 1000)/1000
      $(trs[1]).find("td.avg").text(avg + " (" + avg3 + ")")
  })
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
      errors.append("<li>" + data[key] + "</li>")
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
    jQuery.facebox({ ajax: data.path });
    $(document).bind('reveal.facebox', function(){
      Epure.showNotice(data.notice);
      $(document).unbind("reveal.facebox");
    })
  });
  
  $("#facebox a.delete").live("click", function(){
    jQuery(document).trigger('close.facebox');
  });
  
  $("form.edit_schedule_settings").live("ajax:success", function(ev, data, status, xhr){
    Epure.reload();
  });
  
  $("form.edit_schedule").live("ajax:success", function(ev, data, status, xhr){
    $("#info .year").text(data.year);
    $("#info .sem").text(data.semester);
    jQuery(document).trigger('close.facebox');
  });
  
  $("#facebox #color-schemes-reset, #facebox #color-schemes-bw").live("ajax:success", function(ev, data, status, xhr){
    Epure.reload();
    jQuery.facebox({ ajax: $("#menu-settings").attr("href") });
    $(document).bind('reveal.facebox', function(){
      Epure.showNotice(data.notice);
      $(document).unbind("reveal.facebox");
    });
  });
  
  $("#new-empty-schedule, #new_schedule").live("ajax:success", function(ev, data, status, xhr){
    document.location.href = data.path;
  })
  
  $("#picker").livequery(function(){
    var farb = $.farbtastic('#picker');
    var picker = $('#picker').css('opacity', 0.15);
    var selected;
    $('.color-scheme input[type="text"]').each(function () { 
      farb.linkTo(this); 
      $(this).css('opacity', 0.75); 
    }).focus(function() {
      if (selected) {
        $(selected).css('opacity', 0.75).removeClass('color-selected');
      }
      farb.linkTo(this);
      picker.css('opacity', 1);
      $(selected = this).css('opacity', 1).addClass('color-selected');
    });
  })

  $("#avg table td.ects input").livequery("change", calculate)
  $("#avg table td.grade input").livequery("change", calculate)
  $("#avg_more").click(function(){
    div = '<div class="semester"></div>'
    table = '<table>\
                                        <tr>\
                                                <th class="name">Nazwa kursu</th>\
                                                <th>ECTS</th>\
                                                <th>Ocena</th>\
                                                <th>Srednia</th>\
                                        </tr>\
                                </table>'

    ftr = $(tr)
    ftr.append('<td class="avg" rowspan="1">')
    ftr.find("a").addClass("f")

    $("#avg").append(
      $(div).append("<h4></h4>").append(
        $(table).append(ftr)
      ).append($('<input type="button" class="add" value="Dodaj kurs"/>').click(function(){
        atr = $(tr)
        atr.find("td a").click(function(){
          $(this).parent().parent().remove()
          tdavg = $(this).parent().parent().parent().find("td.avg")
          tdavg.attr("rowspan", parseInt(tdavg.attr("rowspan"))-1)
          return false;
        })
        tdavg = $(this).parent().find("table").append(atr).find("td.avg")
        tdavg.attr("rowspan", parseInt(tdavg.attr("rowspan"))+1)
      }))
    )
    $(this).remove()
  })
  calculate()
})

