require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit quotes_url
  #
  #   assert_selector "h1", text: "Quote"
  # end
  test 'visiting the homepage' do
    visit root_url
    assert_selector 'span', text: 'Motivational'
    assert_selector ".card-body", count: Quote.count
  end

  test "lets a signed in user create a new quote" do
    login_as users(:james)
    visit "/quotes/new"
    # save_and_open_screenshot

    fill_in "quote_title", with: "Imagination is the beginning of creation."
    fill_in "quote_author", with: "George Bernard Shaw"
    # save_and_open_screenshot

    click_on 'Create Quote'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal dashboard_path, page.current_path
    assert_text "Imagination is the beginning of creation."
  end
end
