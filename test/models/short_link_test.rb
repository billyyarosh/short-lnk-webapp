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

end
