=begin
- Welcome to the twitter bot made by Aymen Bida

- This bot has two main functionalities: auto_tweet and tweet_now

  - tweet_now :
  You choose the tweet_now function by pressing [1]
  You get to write a tweet and tweet it right away

  - auto_tweet :
  You choose the auto_tweet function by pressing [2]
  You get to write a tweet and choose how many times you want it to be tweeted and at which interval
=end

require_relative '../lib/bida_lib.rb'
require_relative '../lang/en.rb'
require_relative '../lib/config.rb'
require 'twitter'
err = nil
ans = nil
message = nil

clear
puts greeting
line_return
conf = Config.new
conf.auto_config

# conf.client.update("I'm tweeting with @gem!")
# conf.client.search("#microverse -rt", lang: "en").first.full_text

puts introduction
line_return
print enter_to_continue
wait_for_user

loop do
  clear
  puts choose_mode
  puts err if err == not_in_range(1, 2)
  ans = get_it.to_i
  break if ans.between?(1, 2)
  err = not_in_range(1, 2)
end

if ans == 1
  loop do
    loop do
      clear
      puts type_message
      if err == no_message
        puts err
      else
        line_return
      end
      print '  - '
      message = get_it
      unless message.empty?
        err = nil
        break
      end
      err = no_message
    end
    loop do
      clear
      puts your_tweet(message)
      puts err if err == not_in_range(1, 2)
      ans = get_it.to_i
      break if ans.between?(1, 2)
      err = not_in_range(1, 2)
    end
    if ans == 1
      break
    else
      line_return
      puts try_again
      sleep(1)
    end
  end
end

conf.client.update(message)
puts processing
animate('----------', 0.2)
line_return 2
puts success
sleep(1)
line_return
puts thank_you