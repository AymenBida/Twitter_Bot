# rubocop:disable Metrics/BlockLength

require_relative '../lib/bida_lib'
require_relative '../lang/en'
require_relative '../lib/config'
require_relative '../lib/control'
require 'twitter'

conf = Config.new
ctrl = Control.new

clear
puts greeting
print "\n"

ask_for('API key')
conf.app_usr = gets.chomp.strip
ask_for('API secret key')
conf.app_pass = gets.chomp.strip
print "\n"
ask_for('Access token')
conf.twit_user = gets.chomp.strip
ask_for('Access token secret')
conf.twit_pass = gets.chomp.strip
print "\n"
conf.config_single_user

puts warning
print "\n"
print 'press ENTER to continue '
gets.chomp

clear
puts introduction
print "\n"
print 'press ENTER to continue '
gets.chomp

loop do
  loop do
    clear
    puts choose_mode
    puts show_error(ctrl.err, not_in_range(1, 2))
    ctrl.mode = gets.chomp.strip.to_i
    break if ctrl.mode.between?(1, 2)

    ctrl.err = not_in_range(1, 2)
  end

  loop do
    loop do
      clear
      puts type_message
      ctrl.err == no_message ? puts(ctrl.err) : print("\n")
      print '  - '
      ctrl.message = gets.chomp.strip
      unless ctrl.message.empty?
        ctrl.err = nil
        break
      end
      ctrl.err = no_message
    end
    loop do
      clear
      puts your_tweet(ctrl.message)
      puts show_error(ctrl.err, not_in_range(1, 2))
      ctrl.ans = gets.chomp.strip.to_i
      break if ctrl.ans.between?(1, 2)

      ctrl.err = not_in_range(1, 2)
    end
    break if ctrl.ans == 1

    print "\n"
    puts try_again
    sleep(1)
  end

  case ctrl.mode
  when 1
    ctrl.tweet_now(conf.client)
    puts processing
    '----------'.split('').each do |j|
      print j
      sleep(0.2)
    end
    2.times { print "\n" }
    puts success
  when 2
    loop do
      clear
      puts how_many_times
      puts show_error(ctrl.err, not_in_range(2, 10))
      ctrl.how_many = gets.chomp.strip.to_i
      break if ctrl.how_many.between?(2, 10)

      ctrl.err = not_in_range(2, 10)
    end
    loop do
      clear
      puts interval?
      puts show_error(ctrl.err, not_in_range(1, 30))
      ctrl.interval = gets.chomp.strip.to_i
      break if ctrl.interval.between?(1, 30)

      ctrl.err = not_in_range(1, 30)
    end
    clear
    ctrl.how_many.times do |i|
      ctrl.auto_tweet(conf.client, i)
      puts sending(i + 1)
      '----------'.split('').each do |j|
        print j
        sleep(0.2)
      end
      print "\n"
      puts success
      break if i == ctrl.how_many - 1

      print "\n"
      puts waiting_for_interval(ctrl.interval)
      sleep(ctrl.interval * 60)
      print "\n"
    end
  end

  print "\n"
  print 'press ENTER to continue '
  gets.chomp

  loop do
    clear
    puts want_anything_else
    puts show_error(ctrl.err, not_in_range(1, 2))
    ctrl.ans = gets.chomp.strip.to_i
    if ctrl.ans.between?(1, 2)
      ctrl.err = nil
      break
    end
    ctrl.err = not_in_range(1, 2)
  end

  break if ctrl.ans == 2
end

sleep(1)
print "\n"
thank_you
2.times { print "\n" }

# rubocop:enable Metrics/BlockLength
