$(function() {
  
  $("#new_project").click(function() {
    url = '/projects/new';
    $.ajax({
      url: url,
      dataType: 'script'
    });
    return false;
  });
  
  
  $("a.project_link").live('click', function(){
    url_action = "/projects/find/";
    data_param = {data_param: $(this).text()};
    $.ajax({
      url: url_action,
      data: data_param,
      dataType: 'script',
      type: 'get'
    });
    return false;
    Elastic.refresh();
  });
  
  $("a.dev_link").live('click', function() {
    url_action = "/developers/" + $(this).attr('id');
    $.ajax({
      url: url_action,
      type: 'get',
      dataType: 'script'
    });
    return false;
  });
  
});