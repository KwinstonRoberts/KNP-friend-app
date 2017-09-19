
$(document).ready(function(){
  MakeChannel('<%=@userPtype.name%>','<%=session[:user_id]%>')
  $('#send').on('click',function(e){
    e.preventDefault()
    App.chat.speak($('textarea').val())
    $('textarea').val('')
  })
  $('li>button').on('click',function(e){
    e.preventDefault()
    MakeChannel(e.target.name,'<%=session[:user_id]%>')
    $('textarea').val('')
  })
});