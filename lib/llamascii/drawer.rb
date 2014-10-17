require 'action_view'

module Llamascii
  class Drawer
    include ActionView::Helpers::TextHelper

    attr_reader :message
    MAX_LINE_LENGTH = 20

    def initialize(message = "")
      @message = message
    end

    def self.draw(message)
      d = Drawer.new(message)
      output = ""      
      output << d.draw_llama
      output << d.draw_message
    end

    def draw_llama
      base_llama
    end

    def draw_message
      return "empty" if message.empty?

      "".tap do |o|
        #o << "-".center(MAX_LINE_LENGTH+5, '-')
        #o << "\n"
        o << formatted_message
        #o << "\n"
        #o << "-".center(MAX_LINE_LENGTH+5, '-')
        #o << "\n"
      end
    end

    protected

    def formatted_message
      msg = message.gsub("\n", "").gsub("\r", "")
      # split after x words, when x+1 words is > MAX_LINE_LENGTH
      msg = word_wrap(msg, line_width: MAX_LINE_LENGTH + 5)
      centered = ""
      msg.split("\n").each do |line|
        centered << '|' << line.center(MAX_LINE_LENGTH + 5, ' ') << "|\n"
      end.join("")
      centered
    end

    def base_llama
      <<-LLAMA
       ,
      ~)
       (_---;
        /|~|\\
       / / /|
      LLAMA
    end
  end
end
