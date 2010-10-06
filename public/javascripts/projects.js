$(function() {
  
  $(".new_element").live('click', function() {
    url = '/' + $(this).attr('name') + '/new';
    $.ajax({
      url: url,
      dataType: 'script'
    });
    return false;
  });
  
  $(".form_element").live('submit', function() {
    data_param = $(this).serialize();
    url_action = $(this).attr('action');
    $.ajax({
      url: url_action,
      data: data_param,
      type: 'post',
      dataType: 'script'
    });
    return false;
  });
  
  $("a.project_link").live('click', function(){
    url_action = "/projects/find/";
    data_param = {data_param: $(this).attr('id')};
    $.ajax({
      url: url_action,
      data: data_param,
      dataType: 'script',
      type: 'get'
    });
    return false;
    Elastic.refresh();
  });
  
  $("a.user_project_link").live('click', function() {
    url_action = "/projects/task/"
    data_param = {data_param: $(this).attr('name'), data_proj: $(this).attr('id')};
    $.ajax({
      url: url_action,
      data: data_param,
      dataType: 'script'
    });
    return false;
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