require_relative '../lib/bida_lib.rb'

describe '#line_return' do
  context 'when the method is called without arguments' do
    it 'prints 1 empty line' do
      expect { line_return }.to output("\n").to_stdout
    end
  end

  context 'when the method is called with a number as an argument' do
    it 'prints 4 empty lines if the number is equal to 4' do
      expect { line_return(4) }.to output("\n\n\n\n").to_stdout
    end

    it 'prints 6 empty lines if the number is equal to 6' do
      expect { line_return(6) }.to output("\n\n\n\n\n\n").to_stdout
    end

    it 'prints 10 empty lines if the number is equal to 10' do
      expect { line_return(10) }.to output("\n\n\n\n\n\n\n\n\n\n").to_stdout
    end
  end
end

describe '#make_cardinal' do
  context 'when the method is called with a number as an argument' do
    it 'outputs "1st" if the number is equal to 1' do
      expect(make_cardinal(1)).to eq('1st')
    end

    it 'outputs "2nd" if the number is equal to 2' do
      expect(make_cardinal(2)).to eq('2nd')
    end

    it 'outputs "3rd" if the number is equal to 3' do
      expect(make_cardinal(3)).to eq('3rd')
    end

    it 'outputs "4th" if the number is equal to 4' do
      expect(make_cardinal(4)).to eq('4th')
    end

    it 'outputs "77th" if the number is equal to 77' do
      expect(make_cardinal(77)).to eq('77th')
    end
  end
end

describe '#show_error' do
  context 'when the method is called with 2 arguments' do
    it "outputs the first argument if it's equal to the second one" do
      expect { show_error('text', 'text') }.to output("text\n").to_stdout
    end

    it 'returns nil if the two arguments are not equal' do
      expect(show_error('text', 'bird')).to be nil
    end
  end
end
