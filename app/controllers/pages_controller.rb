require 'rest-client'
require 'json'

class PagesController < ApplicationController
  before_action :all_quotes
  skip_before_action :authenticate_user!, only: %i[home daily]

  def home
  end

  def dashboard
    @user = current_user
    url = "https://zenquotes.io/api/today"
    response = RestClient.get url
    @data = JSON.parse(response)
  end

  def daily
    @quote = @quotes.sample
  end

  private

  def all_quotes
    @quotes = Quote.all
  end
end
