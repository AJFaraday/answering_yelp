# Answering Yelp
Providing concise answers to the tweets of @hard_to_yelp

## Installation

* Clone this from GitHub
* `ruby script/init_confing.rb`
* Register an app with Twitter
* Put the consumer_key and cosumer_secret of that app into config/twitter.yml
* `ruby script/authorise_app.rb`
* Follow instructions to authorise the account that'll send the tweets

## Run

* `ruby script/run.rb`

Perhaps set up a cron job to do this regularly
