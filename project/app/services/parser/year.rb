module Parser
  class Year
    def initialize(year)
      @year = year
      
    end

    def parse
      parsed = ''
      whole = @year / 1000
      parsed += forth(whole)
      remainder = @year % 1000

      whole = remainder / 100
      parsed += third(whole)
      remainder = remainder % 100

      whole = remainder / 10
      parsed += second(whole)
    end

    def forth(number)
      case number
      when 1 then 'хиляда'
      when 2..9 then parse_cardinal(number) + 'хиляди'
      else ''
      end
    end

    def third(number)
      case number
      when 1 then 'сто'
      when 2 then 'двеста'
      when 3 then 'триста'
      when 4..9 then parse_cardinal(number) + 'стотин'
      else ''
      end
    end

    def second(number)
      case number
      when 10 then 'и десета'
      when 11 then 'единадесета'
      when 12 then 'дванадесета'
      when 13..19 then parse_cardinal(number % 10) + 'надесета'
      when 20..29 then 'двадесет и ' + parse_ordinal(number % 10)
      when 30..99 then parse_cardinal(number / 10) + 'десет и ' + parse_ordinal(number % 10)
      else ''
      end
    end

    def parse_cardinal(number)
      {
        1 => 'едно',
        2 => 'две',
        3 => 'три',
        4 => 'четири',
        5 => 'пет',
        6 => 'шест',
        7 => 'седем',
        8 => 'осем',
        9 => 'девет'
      }.fetch(number)
    end

    def parse_ordinal(number)
      {
        1 => 'първа',
        2 => 'втора',
        3 => 'трета',
        4 => 'четвърта',
        5 => 'пета',
        6 => 'шеста',
        7 => 'седма',
        8 => 'осма',
        9 => 'девета'
      }.fetch(number)
    end
  end
end