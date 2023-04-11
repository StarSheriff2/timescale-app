require "test_helper"

class PageLoadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_load = page_loads(:one)
  end

  test "should get index" do
    get page_loads_url
    assert_response :success
  end

  test "should get new" do
    get new_page_load_url
    assert_response :success
  end

  test "should create page_load" do
    assert_difference("PageLoad.count") do
      post page_loads_url, params: { page_load: { user_agent: @page_load.user_agent } }
    end

    assert_redirected_to page_load_url(PageLoad.last)
  end

  test "should show page_load" do
    get page_load_url(@page_load)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_load_url(@page_load)
    assert_response :success
  end

  test "should update page_load" do
    patch page_load_url(@page_load), params: { page_load: { user_agent: @page_load.user_agent } }
    assert_redirected_to page_load_url(@page_load)
  end

  test "should destroy page_load" do
    assert_difference("PageLoad.count", -1) do
      delete page_load_url(@page_load)
    end

    assert_redirected_to page_loads_url
  end
end
