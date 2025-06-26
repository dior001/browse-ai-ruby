# Browse AI Ruby Client

A Ruby wrapper for the Browse AI API.

https://www.browse.ai/docs/api/v2

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'browse_ai'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install browse_ai

## Usage

Set the client API key.
```
BrowseAi.api_key = <your API key>
```

Get robots.
```
robots = BrowseAi.client.get_robots
```

Get a robot.
```
robot = BrowseAi.client.get_robot(id: '<robot UUID>')
```

Get a robot's tasks.
```
tasks = BrowseAi.client.get_tasks(robot_id: '<robot UUID>')
```

Get a robot's task.
```
task = BrowseAi.client.get_tasks(robot_id: '<robot UUID>', id: '<task UUID>')
```

Run a robot.
```
# Example JSON payload. The input parameters will vary depending on your robot's configuration.
payload = {'inputParameters' => {'originUrl' => 'Test'}}.to_json 
task = BrowseAi.client.run_robot(robot_id: '<robot UUID>', payload:)
```

Get a robot's monitors.
```
monitors = BrowseAi.client.get_monitors(robot_id: '<robot UUID>')
```

Get a robot's monitor.
```
monitor = BrowseAi.client.get_monitors(robot_id: '<robot UUID>', id: '<monitor UUID>')
```

Get a robot's webhooks.
```
webhooks = BrowseAi.client.get_webhooks(robot_id: '<robot UUID>')
```

## Testing

Testing uses [RSpec](https://github.com/rspec/rspec), [Webmock](https://github.com/bblimke/webmock) and [VCR](https://github.com/vcr/vcr).

<strong>Tests will make real requests to the API endpoints</strong>. Ensure your test and production data is separated.

<strong>Tests currently require real data to exist for each resource.</strong> 
Tests will fail if no data is present in your account for a specific resource.
For example `spec/browse_ai/dsl/robots_spec.rb` will fail if you have not yet added a robot to your account.

### Test setup
- Copy and rename `config/gem_secret.yml.example` to `config/gem_secret.yml` . <strong>Do not check `config/gem_secret.yml` into version control</strong>.
- In `config/gem_secret.yml` fill in your test API key. `browse_ai_api_key: '<your API key>'`
- Run rspec `bundle exec rspec` 

## API Documentation
https://www.browse.ai/docs/api/v2

## Contributing

1. Fork it ( https://github.com/dior001/browse-ai-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
