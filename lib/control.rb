require_relative '../lang/en.rb'
require_relative 'bida_lib.rb'

class Control
  attr_accessor :err, :message, :ans, :mode, :times, :interval

  def initialize
    @err = nil
    @message = nil
    @ans = nil
    @mode = nil
    @times = nil
    @interval = nil
  end

  def tweet_now(client)
    client.update(@message)
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
