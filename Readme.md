Because launchrock wasn't MVP enough.

---

This is a simple app designed to be deployed
to Heroku and gather email addresses in
Mailchimp.

---

## Getting started

Clone the repo, bundle install gems. Ensure you have
Redis running.

Copy the example config add your Mailchimp API key
and the ID of the list you want to subscribe users
to:

    cp config.yml.example config.yml

Run locally with:

    foreman start

Modify the views and layouts to your hearts content

## Deploying

Create your heroku app:

    heroku create my_awesome_idea

Set your Mailchimp API key and list id

    heroku config:add MAILCHIMP_API_KEY=my-api-key MAILCHIMP_LIST_ID=my-list-id

Push the app

    git push heroku master

...profit.
