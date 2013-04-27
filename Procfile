web: unicorn config.ru
worker: env TERM_CHILD=1 QUEUES=* bundle exec rake resque:work
