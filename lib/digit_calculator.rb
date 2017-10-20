# Calcula qual e o digito que esta na posicao informada
# Retorna hash com o numero, o digito e a posicao do digito
class DigitCalculator
  attr_reader :number
  attr_accessor :digits, :digit_base, :digit_bases, :digit_count

  def initialize(number)
    @number = number
    @digits = 1
    @digit_base = 9
    @digit_bases = []
    @digit_count = 0
  end

  def self.calculate(total)
    return { number: total, digit_position: total, position: 1 } if total <= 9
    new(total).calculate
  end

  def calculate
    total_digits_proximity_by_number
    positions = split_position_number
    build_result(positions[position].to_i, position)
  end

  private

  def split_position_number
    positions = {}
    if position_number.to_s.size > 1
      position_number.to_s.size.times { |i| calculate_positions(positions, i) }
    else
      positions[position] = position_number
    end
    positions
  end

  def calculate_positions(positions, count)
    if count + 1 == position_number.to_s.size
      positions[0] = position_number.to_s[count]
    else
      positions[count + 1] = position_number.to_s[count]
    end
  end

  def build_result(digit_position, position)
    {
      number: position_number,
      digit_position: digit_position,
      position: position
    }
  end

  def total_digits_proximity_by_number
    while number > digit_count
      digit_bases << [digit_base, digits]
      self.digit_base *= 10
      self.digits += 1

      self.digit_count = (digit_base * digits) + sum_digit_bases
    end
  end

  def sum_digit_bases
    digit_bases.inject(0) { |sum, group| sum + group.inject(:*) }
  end

  def position_number
    @positon_number ||= calculate_postion_number
  end

  def calculate_postion_number
    product = total / digits
    product += 1 unless position.zero?
    product += (digits - 1).times.inject(1) { |sum, _| sum * 10 } - 1
    product
  end

  def total
    @total ||=
      number - digit_bases.inject(0) { |sum, group| sum + group.inject(:*) }
  end

  def position
    @position ||= total % digits
  end
end
