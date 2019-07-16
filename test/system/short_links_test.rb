require "application_system_test_case"

class ShortLinksTest < ApplicationSystemTestCase
  setup do
    @short_link = short_links(:one)
  end

  test "creating a Short link" do
    visit short_links_url
    click_on "New Short Link"

    fill_in "Full url", with: @short_link.full_url
    click_on "Create Short link"

    assert_text "Short link was successfully created"
    click_on "Back"
  end

end
