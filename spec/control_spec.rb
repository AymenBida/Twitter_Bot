require_relative '../lib/control'
require_relative '../lib/config'
require 'twitter'

describe Control do
  subject(:ctrl) { described_class.new }
  let(:conf) { Config.new }

  describe '#initialize' do
    # No need to test this standard method
  end

  describe '#tweet_now' do
    context 'when the method is called' do
      before do
        ctrl.instance_variable_set(:@message, 'Hello')
        conf.instance_variable_set(:@client, Twitter::REST::Client.new)
      end

      it 'calls the #update method on the client object with the @message as argument' do
        expect(conf.client).to receive(:update).with(ctrl.message)
        ctrl.tweet_now(conf.client)
      end
    end
  end

  describe '#auto_tweet' do
    context 'when the method is called' do
      before do
        ctrl.instance_variable_set(:@message, 'Hello')
        conf.instance_variable_set(:@client, Twitter::REST::Client.new)
      end

      it 'calls the #update method on the client object with the @message modified with template' do
        arg = 1
        message_modified = "[auto_tweet_##{arg + 1}]\n- #{ctrl.message}"
        expect(conf.client).to receive(:update).with(message_modified)
        ctrl.auto_tweet(conf.client, arg)
      end
    end
  end
end
