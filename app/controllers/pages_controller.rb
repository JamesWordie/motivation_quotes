class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @quotes = Quote.all
  end

  def dashboard
    @user = current_user
    @quotes = @user.quotes
  end
end
