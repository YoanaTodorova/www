# бройно
module Parser
  class CardinalNumber
    attr_accessor :parsed

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

    def initialize(number)
      @number = number.to_i
      @parsed = ''

      parse
    end

    def parse
      @parsed += parse_4(@number / 1000)
      @number = @number % 1000
      @parsed += parse_3(@number / 100)
      @number = @number % 100
      @parsed += parse_2(@number)
    end

    def parse_4(number)
      case number
      when 1 then 'хиляда'
      when 2..9 then NUMBERS[number] + 'хиляди'
      else ''
      end
    end

    def parse_3(number)
      case number
      when 1 then 'сто'
      when 2 then 'двеста'
      when 3 then 'триста'
      when 4..9 then NUMBERS[number] + 'стотин'
      else ''
      end
    end

    def parse_2(number)
      case number
      when 1..9 then NUMBERS[number]
      when 10 then 'и десет'
      when 11 then 'единадесет'
      when 12 then 'дванадесет'
      when 13..19 then NUMBERS[number % 10] + 'надесет'
      when 20..29 then 'двадесет и ' + NUMBERS[number % 10]
      when 30..99 then NUMBERS[number / 10] + 'десет и ' + NUMBERS[number % 10]
      else ''
      end
    end

  end
end