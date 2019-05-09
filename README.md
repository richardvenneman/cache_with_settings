[![Build Status](https://travis-ci.org/richardvenneman/cache_with_settings.svg?branch=master)](https://travis-ci.org/richardvenneman/cache_with_settings)

# Rails cache with settings
This project started as a fork of [cache_with_locale](https://github.com/igorkasyanchuk/cache_with_locale). Besides the locale I also needed the current currency as part of our cache keys. So this gem automatically adds the current locale (I18n.locale) and currency (MoneyRails.default_currency) as parts of caching keys in Rails views.

## Problem & Solution
For example you have:
- Rails app with different locales and currencies
- you want to add fragment caching in views

When you add locales and currencies to your cache keys:

```
  = cache [@user, I18n.locale, MoneyRails.default_currency] do
    = render @user
```

As you see you need to add `I18n.locale` and `MoneyRails.default_currency` as a part of the cache key. And you need to do it everywhere. What if you forget about it in some view?

This gem is a simple solution which allows you to DRY your code. So now you can write

```
  = cache @user do
    = render @user
```

And let gem handle all work. You don't need to specify locale as a cache sufix/prefix.

## Usage
Just add this gem to your Gemfile.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cache_with_settings'
```

And then execute:
```bash
$ bundle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
