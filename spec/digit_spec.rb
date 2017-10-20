require 'spec_helper'

describe Digit do
  describe '.position' do
    it 'informa o número e a posição do algarismo informado' do
      expect(Digit.position(1)).to(
        eq 'O algarismo que está na posição 1 é o primeiro do número 1, portanto: 1'
      )

      expect(Digit.position(10)).to(
        eq 'O algarismo que está na posição 10 é o primeiro do número 10, portanto: 1'
      )

      expect(Digit.position(450)).to(
        eq 'O algarismo que está na posição 450 é o último do número 186, portanto: 6'
      )

      expect(Digit.position(1604)).to(
        eq 'O algarismo que está na posição 1604 é o segundo do número 571, portanto: 7'
      )
    end
  end
end
