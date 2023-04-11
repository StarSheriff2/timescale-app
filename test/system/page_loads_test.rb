require "application_system_test_case"

class PageLoadsTest < ApplicationSystemTestCase
  setup do
    @page_load = page_loads(:one)
  end

  test "visiting the index" do
    visit page_loads_url
    assert_selector "h1", text: "Page loads"
  end

  test "should create page load" do
    visit page_loads_url
    click_on "New page load"

    fill_in "User agent", with: @page_load.user_agent
    click_on "Create Page load"

    assert_text "Page load was successfully created"
    click_on "Back"
  end

  test "should update Page load" do
    visit page_load_url(@page_load)
    click_on "Edit this page load", match: :first

    fill_in "User agent", with: @page_load.user_agent
    click_on "Update Page load"

    assert_text "Page load was successfully updated"
    click_on "Back"
  end

  test "should destroy Page load" do
    visit page_load_url(@page_load)
    click_on "Destroy this page load", match: :first

    assert_text "Page load was successfully destroyed"
  end
end
