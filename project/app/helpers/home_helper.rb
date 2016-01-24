# require './../services/parsers'
# Dir.glob('./../services/parser/*.rb').each { |f| require f }

module HomeHelper
  def translate
    service = Parser::Main.new(@original_text)

    @translated_text = service.perform
  end
end