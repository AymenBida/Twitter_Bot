require_relative '../lang/en.rb'
require_relative 'bida_lib.rb'

class Control
  attr_reader :ans, :message, :mode, :times, :interval

  def initialize
    @err = nil
    @message = nil
    @ans = nil
    @mode = nil
    @times = nil
    @interval = nil
  end

  def user_input_tweet
    loop do
      loop do
        clear
        puts type_message
        @err == no_message ? puts(@err) : line_return
        print '  - '
        @message = take_it
        unless @message.empty?
          @err = nil
          break
        end
        @err = no_message
      end
      loop do
        clear
        puts your_tweet(@message)
        puts @err if @err == not_in_range(1, 2)
        @ans = take_it.to_i
        break if @ans.between?(1, 2)
  
        @err = not_in_range(1, 2)
      end
      break if @ans == 1
  
      line_return
      puts try_again
      sleep(1)
    end
  end

  def user_choose_mode
    loop do
      clear
      puts choose_mode
      puts @err if @err == not_in_range(1, 2)
      @mode = take_it.to_i
      break if @mode.between?(1, 2)
    
      @err = not_in_range(1, 2)
    end
  end

  def tweet_now(client)
    client.update(@message)
    puts processing
    animate('----------', 0.2)
    line_return 2
    puts success
  end

  def user_input_times
    loop do
      clear
      puts how_many_times
      puts @err if @err == not_in_range(2, 10)
      @times = take_it.to_i
      break if @times.between?(2, 10)

      @err = not_in_range(2, 10)
    end
  end

  def user_input_interval
    loop do
      clear
      puts interval?
      puts @err if @err == not_in_range(1, 30)
      @interval = take_it.to_i
      break if @interval.between?(1, 30)

      @err = not_in_range(1, 30)
    end
  end

  def auto_tweet(client)
    @times.times do |i|
      client.update("[auto_tweet_##{i + 1}]\n- #{@message}")
      puts sending(i + 1)
      animate('----------', 0.2)
      line_return
      puts success
      break if i == @times - 1
      line_return
      puts waiting_for_interval(@interval)
      sleep(@interval)
      line_return
    end
  end
end
