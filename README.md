# Browse AI Ruby Client

A Ruby wrapper for the Browse AI API.

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

## Documentation
https://www.browse.ai/docs/api/v2

## Contributing

1. Fork it ( https://github.com/dior001/browse-ai-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
