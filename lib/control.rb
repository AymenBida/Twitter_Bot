class Control
  attr_accessor :err, :message, :ans, :mode, :how_many, :interval

  def initialize
    @err = nil
    @message = nil
    @ans = nil
    @mode = nil
    @how_many = nil
    @interval = nil
  end

  def tweet_now(client)
    client.update(@message)
  end

  def auto_tweet(client, num)
    client.update("[auto_tweet_##{num + 1}]\n- #{@message}")
  end
end
