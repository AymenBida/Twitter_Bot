require_relative '../lib/bida_lib.rb'

describe '#line_return' do
  context 'when the method is called without arguments' do
    it 'prints 1 empty line' do
      expect { line_return }.to output("\n").to_stdout
    end
  end
end

