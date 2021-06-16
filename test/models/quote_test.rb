require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'quote has a title but no author so is invalid' do
    quote = Quote.new(title: 'Creativity is intelliegnece having fun.')
    assert_not quote.save, "tried to save wuthout author"
  end

  test "quote doesn't have a title or author" do
    quote = Quote.new()
    assert_not quote.save, "tried to save wuthout author or title"
  end

  test 'quote has a author but no title so is invalid' do
    quote = Quote.new(author: "Albert Einstein")
    assert_not quote.save, "tried to save wuthout title"
  end

  test "quote has an author and title but no user_id so is invalid" do
    quote = Quote.new(title: "Creativity is intelliegnece having fun.", author: "Albert Einstein")
    assert_not quote.save, "quote is missing a user id"
  end

   test "quote has incorrect type of input author and title" do
    quote = Quote.new(title: 123456, author: "Albert Einstein")
    assert_not quote.save, "tried to save wuth invalid input type"
  end

  test "quote has an author and title and user_id so is valid" do
    quote = Quote.create(title: "Creativity is intelliegnece having fun.", author: "Albert Einstein", user_id: 1)
    assert quote
  end
end
