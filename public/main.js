$(document).ready(function() {
  $('#btn').click(function() {
    $('#modal').show();
  });

  $('#close').click(function() {
    $('#modal').hide();
  });

  $(document).click(function(event) {
    if (event.target.id == 'modal') {
      $('#modal').hide();
    }
  });

  $('#contact').submit(function(e) {
    e.preventDefault();

    $.ajax({
      type: 'POST',
      url: $('#contact').attr('action'),
      data: $('#contact').serialize()
    })
    .done(function(data) {
      $('#form').text(data);
      setTimeout(function() {
        $('#modal').hide();
      }, 3000);
    })
    .fail(function(data) {
      $('#error').text(data.responseText);
    });
  });
});
