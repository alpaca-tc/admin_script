//= require admin_script/jquery-2.2.4.min
//= require bootstrap-sprockets
//= require admin_script/moment-with-locales
//= require admin_script/bootstrap-datetimepicker.min
//= require_self

'use strict';

$(document).on('ready page:load', function() {
  $('[data-behaviour~=datepicker]').datetimepicker({
    showClose: true,
    format: 'YYYY/MM/DD'
  });

  $('[data-behaviour~=datetimepicker]').datetimepicker({
    showClose: true
  });
});
