require_relative '../lib/bida_lib.rb'
require_relative '../lang/en.rb'
require_relative '../lib/config.rb'
require_relative '../lib/control.rb'
require 'twitter'

conf = Config.new
ctrl = Control.new

clear
puts greeting
line_return
conf.init_single_user # ask for keys to configure the bot
puts warning # show warning about using wrong keys or not having the right permissions
continue?

clear
puts introduction # explain what the bot does
continue?

ctrl.user_choose_mode # ask to choose the functionality

ctrl.user_input_tweet # ask to input the tweet and confirm
if ctrl.mode == 1
  ctrl.tweet_now(conf.client) # tweet !
elsif ctrl.mode == 2
  ctrl.user_input_times # ask for how many times you need to tweet
  ctrl.user_input_interval # ask for intervals beween tweets
  clear
  ctrl.auto_tweet(conf.client) # engage in auto_tweeting !
end

sleep(1)
line_return
thank_you
line_return 2
