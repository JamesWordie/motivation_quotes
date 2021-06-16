require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    sign_in users(:james)
    @quote = quotes(:daily)
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

  test "can create a quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { title: "You are never too old to reinvent yourself.", author: "Steve Harvey" } }
    end
  end

  test "cannot create a quote without title and author" do
    assert_no_difference('Quote.count') do
      post quotes_url, params: { quote: { title: "", author: "" } }
    end
  end

  # due to pundit policies these don't work, I need to look into and study polices test

  # test "can edit a quote" do
  #   get edit_quote_url(@quote)
  #   assert_response :success
  # end

  # test "can delete a quote" do
  #   delete quote_url(@quote)
  #   assert_response :success
  # end
end
