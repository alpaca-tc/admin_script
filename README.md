# AdminScript

A module for creating flexible, simple scripts for project in Rails.

<img width="1147" alt="edit_page_example" src="https://cloud.githubusercontent.com/assets/1688137/21744577/cd1d3bac-d55b-11e6-8a9d-bda96edd4d36.png">

## Why use a AdminScript?

I do not want to design RESTful resource for such scripts that run only a few times a month. A new template is also a complete waste of time.

Therefore, AdminScript provides management page of scripts.
Only once to define model to perform a script, it generates template automatically.
No configuration of routing, controller, template and as so on needed.

## Getting Started

Add AdminScript to your Gemfile:

```ruby
gem 'admin_script'
```

Re-bundle, then run the installer:

    $ bundle exec rails generate admin_script:install

AdminScript provides a rails engine that can display listing of your scripts.
Add the following to your config/routes.rb

```
mount AdminScript::Engine => '/admin_scripts'
```

### Generators

When you have AdminScript installed

```
bundle exec rails generate admin_script:model awesome_script
```

...to create the `AdminScript::AwesomeScript`.

## Development

no doc

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alpaca-tc/admin_script.
