# This is the configuration file for the bot

require_relative '../lang/en.rb'
require_relative 'bida_lib.rb'
require 'twitter'

class Config
  KEYS = {
    api_key: 'API key',
    api_secret: 'API secret key',
    access_token: 'Access token',
    access_secret: 'Access token secret'
  }

  attr_accessor :client

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
    @twit_user = get_key(KEYS[:access_token])
    @twit_pass = get_key(KEYS[:access_secret])
    config_single_user
  end

  def config_single_user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = @app_usr
      config.consumer_secret     = @app_pass
      config.access_token        = @twit_user
      config.access_token_secret = @twit_pass
    end
  end

  def get_key(key)
    puts ask_for(key)
    get_it
  end
end
