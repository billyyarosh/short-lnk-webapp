require 'test_helper'

class ShortLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short_link = short_links(:default)
  end

  test "should get new" do
    get new_short_link_url
    assert_response :success
  end

  test "should create short_link" do
    assert_difference('ShortLink.count') do
      post short_links_url, params: { short_link: { full_url: @short_link.full_url } }
    end

    assert_redirected_to short_link_url(ShortLink.last)
  end

  test "should fail create short_link on invalid full_url" do
    assert_no_changes('ShortLink.count') do
      post short_links_url, params: { short_link: { full_url: nil } }
    end

    assert_no_changes('ShortLink.count') do
      post short_links_url, params: { short_link: { full_url: 'invalid:http://url.com' } }
    end
  end

  test "should show short_link" do
    get short_link_url(@short_link)
    assert_response :success
  end

  test "should redirect valid short link" do
    @short_link.save!
    @short_link = @short_link.reload

    get @short_link.link

    assert_redirected_to @short_link.full_url
  end

  test "should be 404 with invalid short link" do
    @short_link.save!

    assert_raises(ActionController::RoutingError) do
      get "#{@short_link.reload.link}invalid"
    end

  end

end
