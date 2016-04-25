# StoreScraper

[![Build Status](https://travis-ci.org/luckypool/store_scraper.svg?branch=master)](https://travis-ci.org/luckypool/store_scraper)
[![Coverage Status](https://coveralls.io/repos/github/luckypool/store_scraper/badge.svg?branch=master)](https://coveralls.io/github/luckypool/store_scraper?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/luckypool/store_scraper.svg)](https://gemnasium.com/github.com/luckypool/store_scraper)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'store_scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install store_scraper

## Usage

### StoreScraper::Itunes::Ranking

Initialize ranking:

```
jp_game_ranking = StoreScraper::Itunes::Ranking.new(limit: 10, country: 'jp', feed_type: 'topgrossingapplications', genre: 'games')
```

#### find\_by\_id

```
jp_game_ranking.find_by_id(658511662).title
# => "モンスターストライク"
```

#### find\_by\_rank

```
jp_game_ranking.find_by_rank(3).title
# => "LINE：ディズニー ツムツム"
```

#### all

```
jp_game_ranking.all
# => Array of StoreScraper::Itunes::Ranking::Entity objects
```

### StoreScraper::Itunes::App

Initialize app:

```
app_finder = StoreScraper::Itunes::App.new
```

#### find

This method call lookup API

- ref: https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/

```
app_finder.find(658511662).title
# => "モンスターストライク"
```

### StoreScraper::Itunes::App::Entity

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luckypool/store_scraper.

