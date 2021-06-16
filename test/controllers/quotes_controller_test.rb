require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    sign_in users(:james)
  end

  test "redirected if not logged in" do
    sign_out :user
    get dashboard_url
    assert_response :redirect
  end

  test "redirected if not logged in and confrim redirect" do
    sign_out :user
    get dashboard_url
    assert_response :redirect
    follow_redirect!
    assert_select 'h2', 'Log in'
  end

  test "can get to dashboard" do
    get dashboard_url
    assert_response :success
  end

  test "can create a new quote" do
    get new_quote_url
    assert_response :success
  end
end
