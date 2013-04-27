web: bundle exec unicorn config.ru -p $PORT
worker: env TERM_CHILD=1 QUEUES=* bundle exec rake resque:work
