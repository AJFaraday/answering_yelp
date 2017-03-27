# Answering Yelp

Providing concise answers to the tweets of @hard_to_yelp

## What does it do

This feeds the twitter account @answering_yelp.

It looks at the tweets from @hard_to_yelp and formulates an answer. E.g.

@hard_to_yelp "How hard is it to remember 4 drinks orders"

@answering_yelp "It's really hard to remember 4 drinks orders"

## Installation

* Clone this from GitHub
* `ruby script/init_confing.rb`
* Register an app with Twitter (https://apps.twitter.com/)
* Put the consumer_key and cosumer_secret of that app into config/twitter.yml
* `ruby script/authorise_app.rb`
* Follow instructions to authorise the account that'll send the tweets

## Run

* `ruby script/run.rb`

Perhaps set up a cron job to do this regularly
