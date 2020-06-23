$(function(){
  function buildHTML(comment){
    var html =`<div class= 'comment__date__group'> 
                 <span class= 'comment__date__group__name'>
                   ${comment.nickname}
                 </span>  
                 <span class= 'comment__date__group__colon'>
                   :
                 </span>  
                 <span class= 'comment__date__group__text'>
                   ${comment.text}
                 </span>
               </div>`  
    return html;            
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment__date').append(html);
      $('.comment__form__text').val('');
      $('.comment__form__btn').prop('disabled', false);
    })
  })
});
