# plan-pwr.pl

## Requirements
- ruby >= 1.9.2
- postgresql
- wkhtmltopdf (OS X and linux x64 binaries included in ./bin/ )

## Dev run
    $ bundle install
    $ # copy config/database.yml.sample as config/database.yml and ensure it has correct credentials
    $ bundle exec rake db:create db:migrate
    $ bundle exec rails server
