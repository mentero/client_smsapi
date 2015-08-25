# Client SMSApi

[![Code Climate](https://codeclimate.com/github/mentero/client_smsapi/badges/gpa.svg)](https://codeclimate.com/github/mentero/client_smsapi)

[![Test Coverage](https://codeclimate.com/github/mentero/client_smsapi/badges/coverage.svg)](https://codeclimate.com/github/mentero/client_smsapi/coverage)

For details visit [SMSApi](http://www.smsapi.pl/) homepage

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
message = SMSApi::SMS::Message::Eco.new(to: 48123456789, body: 'test')
SMSApi::SMS::Client.new.send_message!(message)
#<SMSApi::Response::Regular:0x007f82eca9ee78 @id=1440528348109731150, @points=0.07, @status=:ok>
```

`.send_message!` will raise an error in case of failure.
There is also `.send_message` alternative available.

## Test mode

You can use library in `test_mode`. Test mode will perform API request without sending a message and charging you.

```ruby
message = SMSApi::SMS::Message::Eco.new(to: 48123456789, body: 'test')
SMSApi::SMS::Client.new(test_mode: true).send_message!(message)
#<SMSApi::Response::Regular:0x007f82eca9ee78 @id=1440528348109731150, @points=0.07, @status=:ok>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mentero/client_smsapi.
