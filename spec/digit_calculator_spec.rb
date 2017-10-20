require 'spec_helper'

describe DigitCalculator do
  describe '.calculate' do
    context 'com um digito' do
      it 'retorna o mesmo número' do
        expect(DigitCalculator.calculate(1)).to eq({ number: 1, digit_position: 1, position: 1 })
        expect(DigitCalculator.calculate(9)).to eq({ number: 9, digit_position: 9, position: 1 })
      end
    end

    context 'com dois digitos' do
      it 'retorna qual o algarismo que estará na posição do número informado' do
        expect(DigitCalculator.calculate(10)).to eq({ number: 10, digit_position: 1, position: 1 })
        expect(DigitCalculator.calculate(189)).to eq({ number: 99, digit_position: 9, position: 0 })
      end
    end

    context 'com 3 digitos' do
      it 'retorna certinho' do
        expect(DigitCalculator.calculate(450)).to eq({ number: 186, digit_position: 6, position: 0  })
        expect(DigitCalculator.calculate(1604)).to eq({ number: 571, digit_position: 7, position: 2  })
        expect(DigitCalculator.calculate(2886)).to eq({ number: 998, digit_position: 8, position: 0  })
        expect(DigitCalculator.calculate(2888)).to eq({ number: 999, digit_position: 9, position: 2  })
        expect(DigitCalculator.calculate(2889)).to eq({ number: 999, digit_position: 9, position: 0  })
      end
    end

    context 'com 4 digitos' do
      it 'sucesso' do
        expect(DigitCalculator.calculate(2890)).to eq({ number: 1000, digit_position: 1, position: 1  })
        expect(DigitCalculator.calculate(8668)).to eq({ number: 2444,  digit_position: 4, position: 3  })
        expect(DigitCalculator.calculate(38889)).to eq({ number: 9999, digit_position: 9, position: 0  })
      end
    end

    context 'com 5 digitos' do
      it 'com sucesso' do
        expect(DigitCalculator.calculate(38890)).to eq({ number: 10000, digit_position: 1, position: 1  })
        expect(DigitCalculator.calculate(38894)).to eq({ number: 10000, digit_position: 0, position: 0  })
        expect(DigitCalculator.calculate(38895)).to eq({ number: 10001, digit_position: 1, position: 1  })
        expect(DigitCalculator.calculate(38891)).to eq({ number: 10000, digit_position: 0, position: 2  })
      end
    end
  end
end
