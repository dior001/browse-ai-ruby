# Browse AI Ruby Client

A Ruby wrapper for the [Browse AI API v2](https://www.browse.ai/docs/api/v2) — robot runs, tasks
and the extracted data they return.

## Stack

Ruby gem. `lib/` holds the client, `spec/` the tests, `config/` the gem plumbing.

```bash
bundle install
bundle exec rspec
```

## Conventions

This is a thin API wrapper: it maps endpoints to methods and parses responses. Business logic
belongs in the app that consumes it, not here. Keep the surface close to the upstream API so a
reader can match a method to a documented endpoint without a translation layer.

Never hit the live Browse AI API from a spec — stub the HTTP.
