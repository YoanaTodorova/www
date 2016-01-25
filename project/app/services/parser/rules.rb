module Parser
  class Rules
    DATE = /\d{1,2} [[:alnum:]]+ \d{3,4}/
    DATE_WITH_DOTS = /\d{1,2}\.\d{1,2}\.\d{3,4}/
    NUMBER = /\d+/
    YEAR = /\d{3,4} г\./

    class << self

      def check_word(word, next_word, next_next_word)
        case
        when DATE.match("#{word} #{next_word} #{next_next_word}")
          return [Parser::Date, "#{word} #{next_word} #{next_next_word}", 3]
        when DATE_WITH_DOTS.match("#{word} #{next_word} #{next_next_word}")
          return [Parser::Date, "#{word},", 1]
        when YEAR.match("#{word} #{next_word}")
          return [Parser::Year, word, 1]
        when NUMBER.match(word)
          return [Parser::CardinalNumber, word, 1]
        else
          database_mapping_or_identity(word)
        end
      end

      def database_mapping_or_identity(word)
        mapping = Mapping.all.find { |m| Regexp.new(m[:name]).match(word) }
        word = mapping[:map_to] if mapping

        [Parser::Identity, word, 1]
      end

    end
  end
end