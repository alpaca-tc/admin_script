'use strict';

import 'bulma/css/bulma.css';
import 'pikaday-time/css/pikaday.css';
import Turbolinks from 'turbolinks';
import Rails from 'rails-ujs';
import Pikaday from 'pikaday-time';

Turbolinks.start();
Rails.start();

function datepicker (element) {
  new Pikaday({
    showTime: false,
    use24hour: false,
    field: element,
    format: 'YYYY/MM/DD'
  });
}

function datetimepicker (element) {
  new Pikaday({
    showTime: true,
    showSeconds: true,
    use24hour: true,
    field: element,
    format: 'YYYY/MM/DD HH:mm:ss'
  });
}

const extractFileName = function (target) {
  var file = target.files[0];

  if (file) {
    return file.name;
  } else {
    return '';
  }
};

document.addEventListener('turbolinks:load', function() {
  Rails.$('.js-datepicker').forEach(function(element) {
    datepicker(element);
  });

  Rails.$('.js-datetimepicker').forEach(function(element) {
    datetimepicker(element);
  });

  Rails.$('.js-file-field').forEach(function(element) {
    Rails.delegate(element, '.js-file-field-input', 'change', function(event) {
      var fileName = extractFileName(event.target);
      var fileNameElement = event.currentTarget.getElementsByClassName('file-name')[0];
      fileNameElement.innerText = fileName;
    });
  });
});
