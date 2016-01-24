# бройно
module Parser
  module CardinalNumber
    NUMBERS = {
      1 => 'един',
      2 => 'две',
      3 => 'три',
      4 => 'четири',
      5 => 'пет',
      6 => 'шест',
      7 => 'седем',
      8 => 'осем',
      9 => 'девет',
      10 => 'десет',
      11 => 'единадесет'
    }

    class << self
      def parse(number)
        number = number.to_i
        return NUMBERS[number] if number < 10
      end

    end
  end
end