module Parser
  class Number
    def parse_4(number)
      case number
      when 1 then 'хиляда'
      when 2..9 then Parser::CardinalNumber.parse(number) + 'хиляди'
      else ''
      end
    end

    def parse_3(number)
      case number
      when 1 then 'сто'
      when 2 then 'двеста'
      when 3 then 'триста'
      when 4..9 then Parser::CardinalNumber.parse(number) + 'стотин'
      else ''
      end
    end

    def parse_2(number)
      case number
      when 1..9 then NUMBERS[number]
      when 10 then 'и десет'
      when 11 then 'единадесет'
      when 12 then 'дванадесет'
      when 13..19 then Parser::CardinalNumber.new(number % 10) + 'надесет'
      when 20..29 then 'двадесет и ' + NUMBERS[number % 10]
      when 30..99 then Parser::CardinalNumber.new(number / 10) + 'десет и ' + NUMBERS[number % 10]
      else ''
      end
    end
    
  end
end