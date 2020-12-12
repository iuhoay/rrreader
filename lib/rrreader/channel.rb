require 'rrreader/channel_item'

module Rrreader
  class Channel
    attr_accessor :description, :title, :link, :items

    def initialize
      @items = []
    end
  end
end
