require "application_system_test_case"

class ShortLinksTest < ApplicationSystemTestCase
  setup do
    @short_link = short_links(:default)
  end

  test "creating a Short link" do
    visit new_short_link_url

    fill_in "Full url", with: @short_link.full_url
    click_on "Create Short link"

    assert_text "Short link was successfully created"
    click_on "Back"
  end

end
