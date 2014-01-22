//= require jquery
//= require jquery_ujs
//= require recurring_select
//= require recurring_select/nl
//= require_tree .

$(function(){

  $(".ui.selection.dropdown").dropdown();

  $('ul.events').each(function() {
    var $eventsList = $(this);
    //if (eventsList.children("li").size() <= 3) return;
    //var hiddenElements = eventsList.children('li:gt(2)', this).hide();
    var count=0;
    $eventsList.find("li").each(function(){
      if(++count == 3){
        $(this).parent().append("<li class='showLink'><a href='javascript:void(0);'>Bekijk meer datums...</a></li>");
      }
      else if(count > 3){
        $(this).css("display","none");
        $(this).addClass("hiddenDate");
      }
    });
    $eventsList.find(".showLink").click(function(){
      $eventsList.find(".hiddenDate").toggle();
      $eventsList.find(".showLink a").text($eventsList.find(".showLink a").text()=="Bekijk meer datums..."?"Bekijk minder datums...":"Bekijk meer datums...");
    });
  });

})