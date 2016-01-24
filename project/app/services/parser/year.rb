module Parser
  class Year
    attr_accessor :parsed

    def initialize(year)
      @year = year
      @parsed = ''

      parse
    end

    def parse
      parsed_year = Parser::OrdinalNumber.new(@year)
      @parsed = parsed_year.take(:feminine)
    end
  end
end