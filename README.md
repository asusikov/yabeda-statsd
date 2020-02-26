# Yabeda Statsd adapter

[Yabeda](https://github.com/yabeda-rb/yabeda) adapter for easy exporting collected custom metrics from your application to the Statsd server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yabeda-statsd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yabeda-statsd

## Usage

### Define metrics

Define Yabeda metrics to collect. Refer to [Yabeda documentation](https://github.com/yabeda-rb/yabeda) for instruction on how to configure and use Yabeda metrics.

### Configure adapter

You can configure host and port of metric's server, interval of collecting metrics via initializer.

Example of `initializers/yabeda_statsd.rb` file:

```ruby
Yabeda::Statsd::Config.configure do |config|
  config.statsd_host = 'http://own.metric.server'
  config.statsd_port = '9125'
end
```

### Start the adapter

To start collecting and sending your metrics to your metric's server run:

```ruby
Yabeda::Statsd.start
```

## Alternatives

View the [list of available monitoring system adapters](https://github.com/yabeda-rb/yabeda#available-monitoring-system-adapters)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/asusikov/yabeda-statsd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yabeda::Statsd project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/yabeda-statsd/blob/master/CODE_OF_CONDUCT.md).
