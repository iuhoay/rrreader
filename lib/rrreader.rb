require 'rrreader/version'
require 'rrreader/parser'

require 'colorize'

module Rrreader
  def self.XML(xml_str)
    parser = Rrreader::Parser.new

    parser.xml(xml_str)
  end

  def self.PRINT(xml_str)
    channel = XML(xml_str)

    puts
    puts "#{channel.title}\n#{channel.description}".colorize(:light_green)
    puts ('-'*50).colorize(:green)
    channel.items.each do |item|
      puts "#{item.title}\n#{item.magnet}".colorize(:green)
      puts ('*'*10).colorize(:green)
    end
    return
  end
end
