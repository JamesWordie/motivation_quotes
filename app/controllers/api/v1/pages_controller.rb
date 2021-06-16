class Api::V1::PagesController < Api::V1::BaseController
  # skip_before_action :authenticate_user!, only: :daily

  def daily
    @quotes = Quote.all
    @quote = @quotes.sample
  end
end
