'use strict';

import 'bulma/css/bulma.css';
import 'pikaday/css/pikaday.css';
import Pikaday from 'pikaday';

function datepicker(element) {
  new Pikaday({
    field: element,
    format: 'YYYY/MM/DD'
  });
}

document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('[data-behaviour~=datepicker]').forEach(function(element) {
    datepicker(element);
  });

  document.querySelectorAll('[data-behaviour~=datetimepicker]').forEach(function(element) {
    datepicker(element);
  });
}, false);
