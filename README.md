# SimpleToken

[![Build Status](https://secure.travis-ci.org/cloverinteractive/simple_token.png?branch=master)](http://travis-ci.org/cloverinteractive/simple_token)

Add an unique 64 chars sha2 or secure random token to your active record models.

**Note:** You should definately try `postgresql` native `UUID` support, if that's not a possibility then `simple_token` has your back.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_token'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_token

## Usage

SimpleToken only has two dependencies, `activerecord` and `activesupport` and it's usage is the same as every `acts_as_` rails plugin out there.

By default SimpleToken expects you to have a `token` field in your table, but I'll show you how to customize this in a bit.

### Default settings

Just a simple call inside your model like this:

```ruby
class Post < ActiveRecord::Base
  has_simple_token
end
```

### Custom settings

By default SimpleToken, uses sha2 as it's digest algorithm and expects a token field to exist in your table but we can change this:

```ruby
class User < ActiveRecord::Base
  has_simple_token :token_field => :secret_hash, :digest_type => :secure_random
end
```

This model will now use `secure_random` to generate the secret token and it will write it to the `secret_hash` field on the users table.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
