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

loop do
  clear
  break if ctrl.user_choose_mode # ask to choose the functionality
end

loop do
  loop do
    clear
    break if ctrl.user_input_message # ask to input the tweet
  end
  loop do
    clear
    break if ctrl.user_confirm_message # confirm the tweet
  end
  break if ctrl.ans == 1 # ask to input the tweet and confirm

  line_return
  puts try_again
  sleep(1)
end

if ctrl.mode == 1
  ctrl.tweet_now(conf.client) # tweet !
  puts processing
  animate('----------', 0.2)
  line_return 2
  puts success
elsif ctrl.mode == 2
  loop do
    clear
    break if ctrl.user_input_times # ask for how many times you need to tweet
  end
  loop do
    clear
    break if ctrl.user_input_interval # ask for intervals beween tweets
  end
  clear
  ctrl.auto_tweet(conf.client) # engage in auto_tweeting !
end

sleep(1)
line_return
thank_you
line_return 2
