# редно
module Parser
  class OrdinalNumber
    attr_accessor :parsed

    NUMBERS = {
      1 => 'първ',
      2 => 'втор',
      3 => 'трет',
      4 => 'четвърт',
      5 => 'пет',
      6 => 'шест',
      7 => 'седм',
      8 => 'осм',
      9 => 'девет',
      10 => 'десет'
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

    def take(gender)
      case gender
      when :feminine then @parsed + 'а'
      when :masculine then @parsed + 'и'
      else @parsed
      end
    end

    def parse_4(number)
      case number
      when 1 then 'хиляда'
      when 2..9 then Parser::CardinalNumber.new(number).parsed + 'хиляди'
      else ''
      end
    end

    def parse_3(number)
      case number
      when 1 then 'сто'
      when 2 then 'двеста'
      when 3 then 'триста'
      when 4..9 then Parser::CardinalNumber.new(number).parsed + 'стотин'
      else ''
      end
    end

    def parse_2(number)
      case number
      when 1..9 then NUMBERS[number]
      when 10 then 'и десет'
      when 11 then 'единадесет'
      when 12 then 'дванадесет'
      when 13..19 then Parser::CardinalNumber.new(number % 10).parsed + 'надесет'
      when 20..29 then 'двадесет и ' + NUMBERS[number % 10]
      when 30..99 then Parser::CardinalNumber.new(number / 10).parsed + 'десет и ' + NUMBERS[number % 10]
      else ''
      end
    end

  end
end