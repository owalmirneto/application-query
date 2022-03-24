# OWS::Queries

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ows-queries', '~> 0.1.6'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install ows-queries
```

## Usage

You can use a Rails generator to create `ApplicationQuery`:

```bash
rails g ows:query:install
```

And you can use a Rails generator to create query classes:


```bash
rails g ows:query:create UsersByEmail User
```

## Contributing

Bug reports and merge requests are welcome on GitLab at https://gitlab.com/[USERNAME]/ows-queries.
