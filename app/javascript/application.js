'use strict';

import 'bulma/css/bulma.css';
import 'pikaday-time/css/pikaday.css';
import Turbolinks from 'turbolinks';
import Rails from 'rails-ujs';
import Pikaday from 'pikaday-time';

Turbolinks.start();
Rails.start();

function datepicker(element) {
  new Pikaday({
    showTime: false,
    use24hour: false,
    field: element,
    format: 'YYYY/MM/DD'
  });
}

function datetimepicker(element) {
  new Pikaday({
    showTime: true,
    showSeconds: true,
    use24hour: true,
    field: element,
    format: 'YYYY/MM/DD HH:mm:ss'
  });
}

document.addEventListener('turbolinks:load', function() {
  Rails.$('[data-behaviour~=datepicker]').forEach(function(element) {
    datepicker(element);
  });

  Rails.$('[data-behaviour~=datetimepicker]').forEach(function(element) {
    datetimepicker(element);
  });
});
