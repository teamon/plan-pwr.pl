# plan-pwr.pl

## Requirements
- ruby 1.9.2
- postgresql
- wkhtmltopdf (OS X and linux x64 binaries included in ./bin/ )

## Dev run
    $ bundle install
    $ # ensure config/database.yml has correct credentials
    $ bundle exec rake db:create db:migrate
    $ bundle exec rails server
