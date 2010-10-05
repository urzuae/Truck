$(function() {
  
  $("a.project_link").live('click', function(){
    url_action = "/projects/find/";
    data_param = {data_param: $(this).text()};
    $.ajax({
      url: url_action,
      data: data_param,
      datatype: "json",
      type: 'get',
      success: function(response) {
        $("#title").html(response[0].name);
        
        for(var i=0;i < response[2].commits.length ;i++){
          $('#commits').append('<tr>'
            +'<td class="date">' + response[2].commits[i].committed_date.substring(0,10) + '</td>'
            +'<td class="date">' + response[2].commits[i].message + '</td>'
            +'</tr>'
          );
        }
        
        
        $('#tracker').text("");
        for(var i=0;i < response[1].length ;i++){
          $('#tracker').append('<tr>'
            +'<td class="date">' + response[1][i].updated_at.substring(0,10) + '</td>'
            +'<td class="status">' + response[1][i].current_state + '</td>'
            +'<td>' + response[1][i].name +'</td>'
            +'</tr>'
          );
        }
      }
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