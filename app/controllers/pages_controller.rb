class PagesController < ApplicationController
  before_action :all_quotes
  skip_before_action :authenticate_user!, only: %i[home daily]

  def home
  end

  def dashboard
    @user = current_user
  end

  def daily
    @quote = @quotes.sample
  end

  private

  def all_quotes
    @quotes = Quote.all
  end
end
