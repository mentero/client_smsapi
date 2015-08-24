# ClientSmsapi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/client_smsapi`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'client_smsapi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install client_smsapi

## Configuration

The client needs your credentials. Configure them!

```ruby
SMSApi.configure do |config|
  config.username = 'what_a_username'
  config.secret   = 'what_a_secret'
end
```

Rails users are recommended to put this code into initializer file such as `config/initializers/smsapi.rb`


## Usage

```ruby

message = SMSApi::SMS::Message.new(to: 48123456789, body: 'test')
SMSApi::SMS::Client.new.send_message!(message)
#
# OR
#

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/client_smsapi.
