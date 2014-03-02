function plan(){
  if($("#iframes iframe#plan").contents().text().indexOf("404") < 0)
    $("#wrapper").html($("#iframes iframe#plan").contents().find("#wrapper")[0].innerHTML);
}

function akz(){
  if($("#iframes iframe#akz").contents().text().indexOf("Katalog zapisowy") > 0){
    $("#courses").html("<table id='tabelka'>" + $("#iframes iframe#akz").contents().find("#tabelaHTML").html() + "</table>");
    $('#tabelka').dataTable({
      "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "wszystkie"]],
      "fnDrawCallback": function(ust){
        sClick();
        sFilter();
      },
      "oLanguage": { // http://datatables.net/plug-ins/i18n#Polish
        "sProcessing":   "Proszę czekać...",
        "sLengthMenu":   "Ile pozycji: _MENU_",
        "sZeroRecords":  "Nie znaleziono żadnych pasujących indeksów",
        "sInfo":         "Pozycje od _START_ do _END_ z _TOTAL_ łącznie",
        "sInfoEmpty":    "Pozycji 0 z 0 dostępnych",
        "sInfoFiltered": "(filtrowanie spośród _MAX_ dostępnych pozycji)",
        "sInfoPostFix":  "",
        "sSearch":       "Szukaj:",
        "sUrl":          "",
        "oPaginate": {
          "sFirst":    "Pierwsza",
          "sPrevious": "Poprzednia",
          "sNext":     "Następna",
          "sLast":     "Ostatnia"
        }
      }
    });
  }
}

function sClick(){
  $("td").unbind("click").click(function(){
    showCourses($(this).parent().find("td:nth-child(4)").html(), $(this).parent());
  });
}

function sFilter(){
  $("tbody tr").removeClass("ukryty");

  if(!$("#bk").attr("checked")){
    $("tbody tr td:nth-child(4)").filter(function() {
      return $(this).text().trim() == "";
    }).parent().addClass("ukryty");
  }

  if($("#empty").attr("checked")){
    $("tbody tr td:nth-child(6)").filter(function() {
        return $(this).text().trim() == "0";
    }).parent().addClass("ukryty");
  }
}

function whatDay(s){
  s = s.replace(/\(|\)/g, "").split("/");

  var day = 0;
  var par = "";
  switch(s[0]){
    case "pn": day = 0; break;
    case "wt": day = 1; break;
    case "śr": day = 2; break;
    case "cz": day = 3; break;
    case "pt": day = 4; break;
  }
  if(s.length != 1){
    switch(s[1]){
      case "TN": par = "w_1"; break;
      case "TP": par = "w_2"; break;
      default: par = ""; break;
    }
  }
  return new Array(day, par);
}

function showCourses(t, el){
  if(t == "") return;
  $('.cudo').remove();
  thing1 = t.replace(/<br>.*?<br>/g, ";");
  thing2 = thing1.split(";");
  thing2.pop();
  var name = el.find("td:nth-child(3)").text();
  var teacher = el.find("td:nth-child(5)").text();
  for(var i = 0; i < thing2.length; i++) {
    s = thing2[i].split(' ');
    d = s[0];
    h = s[1].split('-');
    godz = new Array(parseInt(h[0].split(":")[0]), parseInt(h[1].split(":")[0]));
    min = new Array(parseInt(h[0].split(":")[1]), parseInt(h[1].split(":")[1]));

    day = whatDay(d);
    topq = (((godz[0] - 7) * 60 + min[0]) / 5) * 4;
    sizeq = ((((godz[1] * 60) + min[1]) - ((godz[0] * 60) + min[0])) / 5) * 4;
    thingy = "<div class='entry cudo' style='top: " + topq + "px; height: " + sizeq + "px'><div class='c_X " + day[1] + " wrap'><div class='h'>" + godz[0] + "<sup>" + (min[0] < 10 ? "0" + min[0] : min[0]) + "</sup>-" + godz[1] + "<sup>" + (min[1] < 10 ? "0" + min[1] : min[1]) + "</sup></div><div class='n'>" + name + "</div><div class='l'></div><div class='p'>" + teacher + "</div><div class='t'>X</div></div></div></div>";
    courses = $(".day")[day[0]].innerHTML + thingy;
    $(".day")[day[0]].innerHTML = courses;
    $("html, body").animate({ scrollTop: 0 }, "slow");
  }
}

function loadIt(what) {
  $("#iframes iframe#" + what).load(function(){
    if(what == "plan") plan();
    if(what == "akz") akz();
  });
}

$(document).ready(function(){
  $("#btnid").click(function(){
    url = window.location.href.split("/")[0] + "//" + window.location.href.split("/")[2];
    $("#iframes iframe#plan").attr("src", url + "/" + $('#idbox').val() + ".html");
    $("#iframes iframe#akz").attr("src", url + "/akz/katalog");
    loadIt("plan");
    loadIt("akz");
  });

  $('.checkbox').click(function(){sFilter();});

  if(location.search.substring(1) != '') {
    $("#idbox").val(location.search.substring(1));
    $("#btnid").click();
  }
});

