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

  def user_input_message
    puts type_message
    @err == no_message ? puts(@err) : line_return
    print '  - '
    @message = take_it
    unless @message.empty?
      @err = nil
      return @message
    end
    @err = no_message
    false
  end

  def user_confirm_message
    puts your_tweet(@message)
    show_error?(@err, not_in_range(1, 2))
    @ans = take_it.to_i
    return @ans if @ans.between?(1, 2)

    @err = not_in_range(1, 2)
    false
  end

  def user_choose_mode
    puts choose_mode
    show_error?(@err, not_in_range(1, 2))
    @mode = take_it.to_i
    return @mode if @mode.between?(1, 2)

    @err = not_in_range(1, 2)
    false
  end

  def tweet_now(client)
    client.update(@message)
  end

  def user_input_times
    puts how_many_times
    show_error?(@err, not_in_range(2, 10))
    @times = take_it.to_i
    return @times if @times.between?(2, 10)

    @err = not_in_range(2, 10)
    false
  end

  def user_input_interval
    puts interval?
    show_error?(@err, not_in_range(1, 30))
    @interval = take_it.to_i
    return @interval if @interval.between?(1, 30)

    @err = not_in_range(1, 30)
    false
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
      sleep(@interval * 60)
      line_return
    end
  end
end
