# frozen_string_literal: true

require 'net/http'
require 'json'

# Class for translating
class Translate
  def translate_text(text, target_language)
    url = URI.parse("https://api.mymemory.translated.net/get?q=#{URI.encode_www_form_component(text)}&langpair=en|#{target_language}")
    response = Net::HTTP.get_response(url)

    if response.code == '200'
      translated_text = JSON.parse(response.body)['responseData']['translatedText']
      puts "Translated Text: #{translated_text}"
    else
      puts "Translation failed. Response code: #{response.code}"
    end
  end

  def translate_from_user_input
    print 'Enter the text to translate: '
    text = gets.chomp

    print 'Enter the target language code: '
    target_language = gets.chomp

    translate_text(text, target_language)
  end
end

translator = Translate.new
translator.translate_from_user_input
