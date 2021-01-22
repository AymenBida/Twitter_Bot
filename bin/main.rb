require_relative '../lib/bida_lib.rb'
require_relative '../lang/en.rb'
require_relative '../lib/config.rb'
require_relative '../lib/control.rb'
require 'twitter'

clear
puts greeting
line_return
conf = Config.new
ctrl = Control.new
conf.auto_config

puts introduction
line_return
print enter_to_continue
wait_for_user

ctrl.user_choose_mode

ctrl.user_input_tweet
if ctrl.mode == 1
  ctrl.tweet_now(conf.client)
elsif ctrl.mode == 2
  ctrl.user_input_times
  ctrl.user_input_interval
  clear
  ctrl.auto_tweet(conf.client)
end

sleep(1)
line_return
thank_you
line_return 2
