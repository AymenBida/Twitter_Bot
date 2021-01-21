=begin
- Welcome to the twitter bot made by Aymen Bida

- This bot has two main functionalities: auto_tweet and tweet_now

  - tweet_now :
  You choose the tweet_now function by pressing [1]
  You get to write a tweet and tweet it right away

  - auto_tweet :
  You choose the auto_tweet function by pressing [2]
  You get to write a tweet and choose the time when you want it to be tweeted automaticily
=end

require_relative '../lib/bida_lib.rb'
require_relative '../lang/en.rb'
require_relative '../lib/config.rb'
require 'twitter'

clear
puts greeting
line_return
conf = Config.new
conf.auto_config

conf.client.update("This is a test !")