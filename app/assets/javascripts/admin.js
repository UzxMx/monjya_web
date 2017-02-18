// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require polyfill
//= require const
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require summernote
//= require summernote/locales/zh-CN
//= require bootbox
//= require jquery.bootstrap-growl
//= require plupload/moxie.min
//= require plupload/plupload.full.min
//= require timeago
//= require timeago.zh-cn
//= require selectize

window.toastr = require('toastr');
toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": true,
  "progressBar": true,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
};

function admin_init() {
  $('time.timeago').timeago();

  $('[data-provider="summernote"]').each(function(){
    $(this).summernote({
      lang: 'zh-CN',
      callbacks: {
        onImageUpload: function(files) {
          console.log('onImageUpload');
          console.log('files: ' + files)
        }
      }
    });
  });
}

$(document).on("ready", function() {
  admin_init();
});

window.init_single_plupload = function (elId, token, crop) {
  var $el = $('#' + elId);
  var uploader = new plupload.Uploader({
    runtimes : 'html5',

    browse_button : $el[0], // you can pass in id...
    container: $el.parent()[0], // ... or DOM Element itself

    multi_selection: false,

    url : "http://upload.qiniu.com",

    filters : {
      max_file_size : '10mb',
      mime_types: [
        {title : "JPG/PNG文件", extensions : "jpg,jpeg,JPG,JPEG,png,PNG"}
      ]
    },

    multipart_params : {
      token: token
    },

    resize: {
      width: 1600,
      height: 1600
    },

    // Flash settings
    flash_swf_url : __flash_swf_url,

    init: {
      FilesAdded: function(up, files) {
        $el.parent().append('<div class="uploading"></div>');
        up.start();
      },

      FileUploaded: function(up, file, result) {
        var data = $.parseJSON(result.response);
        var $p = $el.parent();
        $p.find('.uploading').remove();
        $p.next().html("<img class='img-thumbnail' src='" + data.url + "?" + crop + "'/>");
        $p.prev().children().first().val(data.id);
      },

      Error: function(up, err) {
        bootbox.alert($.parseJSON(err.response).error);
      }
    }
  });
  uploader.init();
};