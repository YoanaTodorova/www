module Parser
  module Year
    def self.parse(year)
      parsed_year = Parser::OrdinalNumber.new(year)
      parsed_year.take(:feminine)
    end
  end
end