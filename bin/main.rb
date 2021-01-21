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

puts introduction
line_return
print enter_to_continue
wait_for_user

loop do
  clear
  puts choose_mode
  puts err if err == not_in_range(1, 2)
  ans = take_it.to_i
  break if ans.between?(1, 2)

  err = not_in_range(1, 2)
end

if ans == 1
  loop do
    loop do
      clear
      puts type_message
      err == no_message ? puts(err) : line_return
      print '  - '
      message = take_it
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
      ans = take_it.to_i
      break if ans.between?(1, 2)

      err = not_in_range(1, 2)
    end
    break if ans == 1

    line_return
    puts try_again
    sleep(1)
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
