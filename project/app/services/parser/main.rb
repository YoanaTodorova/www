module Parser
  class Main
    def initialize(original_text)
      @original_text = original_text
    end

    def perform
      splitted = @original_text.split(' ')
      
      processed = splitted.map.with_index do |word, index|
        process_word(word, splitted[index + 1])
      end

      processed.join(' ')
    end

    private

    def process_word(word, next_word)
      Parser::CardinalNumber.new(word).parsed
    end
  end
end
