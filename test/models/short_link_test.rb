require 'test_helper'

class ShortLinkTest < ActiveSupport::TestCase

  test "should save short link with valid full url" do
    valid_link = short_links(:default)
    assert(valid_link.save)
  end

  test "should not save short link without full url" do
    valid_link = short_links(:default)
    valid_link.full_url = nil
    assert_not(valid_link.save)
  end

  test "should not save short link with generally invalid full url" do
    valid_link = short_links(:default)
    valid_link.full_url = 'invalid:http://url.com'
    assert_not(valid_link.save)
  end

  test "should generate a unique url" do
    valid_short_link = short_links(:default)
    valid_short_link.save
    assert(valid_short_link.save)

    link = valid_short_link.reload.link

    assert_match(/#{ShortLinkHostResolver.get_host_url}.*/, link)

    linkUID = link.gsub("#{ShortLinkHostResolver.get_host_url}/", '')

    assert_equal(linkUID.length, 8)
  end

end
