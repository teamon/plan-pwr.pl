# Source code for [plan-pwr.pl](http://plan-pwr.pl)

## Requirements

- ruby >= 2.0.0
- postgresql
- redis
- wkhtmltopdf (OS X and linux x64 binaries included in ./bin/ )

## Setup

```bash
bundle install
cp config/
cp config/database.sample.yml config/database.yml
cp config/application.sample.yml config/application.yml
bundle exec rake db:create db:migrate
bundle exec rails server
```

## Contributing

1. Fork it ( http://github.com/teamon/plan-pwr.pl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
