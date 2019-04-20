# Interage::Query

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interage-query', '~> 0.1'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install interage-query
```

## Usage

You can use a Rails generator to create `ApplicationQuery`:

```bash
rails g interage:query:install
```

And you can use a Rails generator to create query classes:


```bash
rails g interage:query:create UsersByEmail User
```

## Contributing

Bug reports and merge requests are welcome on GitLab at https://gitlab.com/[USERNAME]/interage-query.
