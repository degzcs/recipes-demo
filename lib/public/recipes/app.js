$(function() {
  var $previewContainer = $('#comment-md-preview-container');
  $previewContainer.hide();
  var $md = $(".md-render").markdown({
    onShow: function(e) {
      var content = e.parseContent();
      if (content === '') $previewContainer.hide();
      else $previewContainer.show().find('#comment-md-preview').html(content).find('table').addClass('table table-bordered table-striped table-hover');
      e.change(e);
    }
  });
})
