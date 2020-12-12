require 'rrreader/version'
require 'rrreader/parser'

module Rrreader
  def self.XML(xml_str)
    parser = Rrreader::Parser.new

    parser.xml(xml_str)
  end
end
