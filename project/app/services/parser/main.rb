module Parser
  class Main
    def initialize(original_text)
      @original_text = original_text
      @splitted = @original_text.split(/\s+/)
      @translated = []
    end

    def perform
      build_final
      @translated.join(' ')
    end

    private

    def build_final
      index = 0
      
      while @splitted[index]
        word = @splitted[index]
        
        constant, arguments, offset = process_word(
          word,
          @splitted[index + 1],
          @splitted[index + 2]
        )

        @translated << constant.public_send(:new, *arguments).parsed

        index += offset
      end
    end

    def process_word(word, next_word, next_next_word)
      constant, arguments = Parser::Rules.check_word(word, next_word, next_next_word)
    end
  end

  class Identity
    attr_accessor :parsed
    def initialize(word)
      @parsed = word
    end
  end
end
