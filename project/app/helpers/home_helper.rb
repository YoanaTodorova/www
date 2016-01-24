module HomeHelper
  def translate
    service = Parser::Main.new(@original_text)

    @translated_text = service.perform
  end
end