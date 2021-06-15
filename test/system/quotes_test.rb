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
end
