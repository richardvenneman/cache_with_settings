# CacheWithSettings
CacheWithSettings allows you to add any key to partial caching cache keys. This is useful if your website is multilingual or allows the user to choose a display currency.

[![Build Status](https://github.com/richardvenneman/cache_with_settings/workflows/Ruby/badge.svg)](https://github.com/richardvenneman/cache_with_settings/actions?query=workflow%3ARuby)
[![Gem Version](https://badge.fury.io/rb/cache_with_settings.svg)](https://badge.fury.io/rb/cache_with_settings)

## Problem & Solution
If you find yourself adding dynamic values, such as locales and currencies to your cache keys, this gem could be useful for you. Instead of:

```
  = cache [@user, I18n.locale, MoneyRails.default_currency] do
    = render @user
```

Configure this gem once and just write:

```
  = cache @user do
    = render @user
```

This gem allows you to DRY up your code and forget about including dynamic values in your cache keys.

## Usage
After adding the gem to your Gemfile, configure CacheWithSettings in an initializer. You can specify any dynamic cache keys, such as `I18n.locale`.

```ruby
CacheWithSettings.configure do |config|
  # Specify a proc that returns an array of strings
  config.cache_keys = -> { [I18n.locale.to_s, MoneyRails.default_currency.to_s] }
end
```

That's it! Your template `cache` calls now automatically include the specified cache keys.

Collection caching is also supported. If you're rendering collections with `cached: true` your specified cache keys will automatically be included:

```erb
<%= render partial: "cities/city",
           collection: @cities,
           cached: true %>
```

### HTTP Caching
If you're using a HTTP cache in production (with Rails conditional get), add the dynamic cache keys with the [`etag` directive](https://api.rubyonrails.org/classes/ActionController/ConditionalGet/ClassMethods.html#method-i-etag):

```ruby
class ApplicationController
  etag { CacheWithSettings.cache_keys.call.join("-") }
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cache_with_settings'
```

And then execute:
```bash
$ bundle
```

## Credit
This project started as a fork of [cache_with_locale](https://github.com/igorkasyanchuk/cache_with_locale). Besides the locale I also needed the current currency as part of our cache keys, which led to the creation of this gem.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
