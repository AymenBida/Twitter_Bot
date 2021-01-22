require_relative '../lib/control.rb'
require 'colorize'

describe Control do
  subject(:ctrl) { described_class.new }

  describe '#initialize' do
    # No need to test this standard method
  end

  describe '#user_input_message' do
    context 'when @message is empty' do
      it 'changes @err to no_message' do
        ctrl.message = 'dddddd'
        p ctrl.message
        error_text = "Please don't leave it blank, write something ^^".bold.red
        expect { ctrl.user_input_message }.to change { :@err }.to(error_text)
        ctrl.user_input_message
      end
    end
  end
end
