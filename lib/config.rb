# This is the configuration file for the bot

class Config
  attr_reader :client
  attr_writer :app_usr, :app_pass, :twit_user, :twit_pass

  def initialize
    @app_usr = nil
    @app_pass = nil
    @twit_user = nil
    @twit_pass = nil
    @client = nil
  end

  def config_single_user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = @app_usr
      config.consumer_secret = @app_pass
      config.access_token = @twit_user
      config.access_token_secret = @twit_pass
    end
  end
end
