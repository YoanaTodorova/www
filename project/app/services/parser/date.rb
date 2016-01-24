module Parser
  class Date
    attr_accessor :parsed

    MONTHS = {
      1 => 'януари',
      2 => 'февруари',
      3 => 'март',
      4 => 'април',
      5 => 'май',
      6 => 'юни',
      7 => 'юли',
      8 => 'август',
      9 => 'септември',
      10 => 'октомври',
      11 => 'ноември',
      12 => 'декември'
    }

    def initialize(date)
      @date = date
      @parsed = ''

      parse
    end

    def parse
      date = case @date
             when /\./ then @date.split('.')
             when /\s/ then @date.split(' ')
             end

      @parsed = [
        parse_day(date[0]),
        parse_month(date[1]),
        parse_year(date[2])
        ].join(' ')
    end

    def parse_day(day)
      parsed = Parser::OrdinalNumber.new(day)
      parsed.take(:masculine)
    end

    def parse_month(month)
      if month.to_i.to_s == month
        MONTHS[month.to_i]
      else
        month.downcase
      end
    end

    def parse_year(year)
      Parser::Year.new(year).parsed
    end
  end
end