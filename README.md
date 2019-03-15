# AdminScript

[![Gem Version](https://badge.fury.io/rb/admin_script.png)](http://badge.fury.io/rb/admin\_script)
[![Build Status](https://travis-ci.org/alpaca-tc/admin_script.svg?branch=master)](https://travis-ci.org/alpaca-tc/admin\_script)

A module that creates flexible, simple scripts for Rails project.

[preview](https://user-images.githubusercontent.com/1688137/35339470-120b2fdc-0164-11e8-840d-57ec9f55c47f.png)

## Why use AdminScript?

Sometimes we add a button to admin panel to run automated script, but I do not want to design RESTful resource and create new template for such scripts.   

`AdminScript` provides a page of manage these scripts.  

**All you have to do is adding a script.**  
No configuration of routing, controller or template.

## Getting Started

Add AdminScript to your Gemfile:

```ruby
gem 'admin_script'
```

Re-bundle, then run the installer:

```
$ bundle exec rails generate admin_script:install
```

AdminScript provides a Rails engine that can display form of AdminScript.
Add the following to your `config/routes.rb`

```
mount AdminScript::Engine => '/admin_scripts'
```

### Generators

When you have AdminScript installed, you can run...

```
bundle exec rails generate admin_script:model awesome_script id:integer body:string
```

...to create the `AdminScript::AwesomeScript`.

### Example

```
# app/models/admin_script/awesome_script.rb
class AdminScript::AwesomeScript < AdminScript::Base
  # Define attribute name and type
  attribute :id, :integer

  def perform
    return false unless valid?

    # do something

    true
  end
end

# app/views/*.html.erb
<%= link_to 'All Scripts', AdminScript.railtie_routes_url_helpers.admin_scripts_path %>
<%= link_to 'Show Form', AdminScript.railtie_routes_url_helpers.admin_script_path(AdminScript::AwesomeScript, admin_script: { id: '1' }) %>
<%= link_to 'Perform Script', AdminScript.railtie_routes_url_helpers.edit_admin_script_path(AdminScript::AwesomeScript, admin_script: { id: '1' }), data: { method: :put } %>
```

## Development

```sh
# Compile assets

$ yarn install
$ ./node_modules/.bin/webpack
```

## Links

- [Wiki](https://github.com/alpaca-tc/admin_script/wiki)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alpaca-tc/admin_script.
