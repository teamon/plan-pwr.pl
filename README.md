# plan-pwr.pl

## Requirements
- ruby 1.9.2
- postgresql
- Mac OS X or Linux x64 (wkhtmltopdf dependency)

## Dev run
    $ bundle install
    $ rake db:create db:migrate
    $ script/rails


## Production run
    $ bundle install
    $ bundle exec thin start -e production -p 6666
