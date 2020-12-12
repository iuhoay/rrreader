require 'nokogiri'

require 'rrreader/channel'
require 'rrreader/channel_item'

module Rrreader
  class Parser
    attr_accessor :channel

    def xml(xml_str)
      @doc = Nokogiri::XML(xml_str)

      @channel = Channel.new
      @channel.description = @doc.xpath('//channel/description').text
      @channel.title = @doc.xpath('//channel/title').text
      @channel.link = @doc.xpath('//channel/link').text

      @doc.xpath('//channel/item').each do |item|
        channel_item = ChannelItem.new
        channel_item.link = item.css('link').text
        channel_item.title = item.css('title').text
        channel_item.guid = item.css('guid').text
        channel_item.magnet = item.css('magnet').text

        @channel.items << channel_item
      end

      return @channel
    end

  end
end
