# Chama o service para calcular posicao do algarismo informado
# E apresenta uma mensagem com dados formatados e completos
class Digit
  attr_reader :cardinal_position, :ordinal_position, :number_position, :number

  CARDINAL_POSITIONS = {
    0 => 'último',
    1 => 'primeiro',
    2 => 'segundo',
    3 => 'terceiro',
    4 => 'quarto',
    5 => 'quinto',
    6 => 'sexto',
    7 => 'sétimo',
    8 => 'oitavo',
    9 => 'nono',
    10 => 'decimo'
  }.freeze

  def initialize(number, hash)
    @cardinal_position = CARDINAL_POSITIONS[hash[:position]]
    @ordinal_position = hash[:digit_position]
    @number_position = hash[:number]
    @number = number
  end

  def self.position(number)
    new(number, DigitCalculator.calculate(number)).position
  end

  def position
    "O algarismo que está na posição #{number} é o #{cardinal_position} \
do número #{number_position}, portanto: #{ordinal_position}".strip
  end
end
