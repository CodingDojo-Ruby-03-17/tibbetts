require 'test_helper'

class DojoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dojo_index_url
    assert_response :success
  end

  test "should get new" do
    get dojo_new_url
    assert_response :success
  end

  test "should get show" do
    get dojo_show_url
    assert_response :success
  end

  test "should get edit" do
    get dojo_edit_url
    assert_response :success
  end

end
