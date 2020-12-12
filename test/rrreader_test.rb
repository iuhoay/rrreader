require 'test_helper'
require 'open-uri'

class RrreaderTest < Minitest::Test

  def test_XML
    xml_str = <<-EOF
<rss xmlns:dc="http://purl.org/dc/elements/1.1/" version="2.0">
  <channel>
    <description>description</description>
    <link>a link</link>
    <title>a title</title>
    <item>
      <link>item 1 link</link>
      <title>item 1 title</title>
      <guid>item 1 guid</guid>
      <pubDate>Sat, 24 Oct 2020 10:48:01 +0800</pubDate>
      <magnet>item 1 magnet</magnet>
    </item>
    <item>
      <link>http://app.rrys.tv/</link>
      <title>后翼弃兵.The.Queens.Gambit.S01E01.中英字幕.WEB.720P-人人影视.mp4</title>
      <guid>542704</guid>
      <pubDate>Sat, 24 Oct 2020 10:48:01 +0800</pubDate>
      <magnet>a magnet link</magnet>
    </item>
  </channel>
</rss>
    EOF

    stub_request(:get, 'www.example.com')
      .to_return(status: 200, body: xml_str)

    channel = Rrreader::XML(URI.open('http://www.example.com/'))

    assert_equal channel.description, 'description'
    assert_equal channel.title, 'a title'
    assert_equal channel.link, 'a link'
    assert_equal channel.items.count, 2
    assert_equal channel.items[0].title, 'item 1 title'
    assert_equal channel.items[0].link, 'item 1 link'
    assert_equal channel.items[0].guid, 'item 1 guid'
    assert_equal channel.items[0].magnet, 'item 1 magnet'
  end
end
