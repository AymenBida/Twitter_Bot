# This is the configuration file for the bot

class Config
  KEYS = {
    api_key: 'API key',
    api_secret: 'API secret key',
    access_token: 'Access token',
    access_secret: 'Access token secret'
  }.freeze

  attr_reader :client

  def initialize
    @app_usr = nil
    @app_pass = nil
    @twit_user = nil
    @twit_pass = nil
    @client = nil
  end

  def init_single_user
    @app_usr = get_key(KEYS[:api_key])
    @app_pass = get_key(KEYS[:api_secret])
    line_return
    @twit_user = get_key(KEYS[:access_token])
    @twit_pass = get_key(KEYS[:access_secret])
    line_return
    config_single_user
  end

  private

  def config_single_user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = @app_usr
      config.consumer_secret = @app_pass
      config.access_token = @twit_user
      config.access_token_secret = @twit_pass
    end
  end

  def get_key(key)
    puts ask_for(key)
    take_it
  end
end
