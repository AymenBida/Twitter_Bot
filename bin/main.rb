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
continue

clear
puts introduction # explain what the bot does
continue

loop do
  clear
  puts choose_mode # ask to choose the functionality
  show_error(ctrl.err, not_in_range(1, 2))
  ctrl.mode = take_it.to_i
  break if ctrl.mode.between?(1, 2)

  ctrl.err = not_in_range(1, 2)
end

loop do
  loop do
    clear
    puts type_message
    ctrl.err == no_message ? puts(ctrl.err) : line_return
    print '  - '
    ctrl.message = take_it
    unless ctrl.message.empty?
      ctrl.err = nil
      break
    end
    ctrl.err = no_message
  end
  loop do
    clear
    puts your_tweet(ctrl.message)
    show_error(ctrl.err, not_in_range(1, 2))
    ctrl.ans = take_it.to_i
    break if ctrl.ans.between?(1, 2)

    ctrl.err = not_in_range(1, 2)
  end
  break if ctrl.ans == 1

  line_return
  puts try_again
  sleep(1)
end

if ctrl.mode == 1
  ctrl.tweet_now(conf.client)
  puts processing
  animate('----------', 0.2)
  line_return 2
  puts success
elsif ctrl.mode == 2
  loop do
    clear
    puts how_many_times
    show_error(ctrl.err, not_in_range(2, 10))
    ctrl.how_many = take_it.to_i
    break if ctrl.how_many.between?(2, 10)

    ctrl.err = not_in_range(2, 10)
  end
  loop do
    clear
    puts interval?
    show_error(ctrl.err, not_in_range(1, 30))
    ctrl.interval = take_it.to_i
    break if ctrl.interval.between?(1, 30)

    ctrl.err = not_in_range(1, 30)
  end
  clear
  ctrl.how_many.times do |i|
    ctrl.auto_tweet(conf.client, i)
    puts sending(i + 1)
    animate('----------', 0.2)
    line_return
    puts success
    break if i == ctrl.how_many - 1

    line_return
    puts waiting_for_interval(ctrl.interval)
    sleep(ctrl.interval * 60)
    line_return
  end
end

sleep(1)
line_return
thank_you
line_return 2
