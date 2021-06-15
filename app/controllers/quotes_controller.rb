class QuotesController < ApplicationController
  before_action :find_quote, only: %i[edit update destroy]

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create
    @quote = Quote.new(quote_params)
    authorize @quote
    @quote.user = current_user
    if @quote.save
      redirect_to dashboard_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @quote.update!(quote_params)
    redirect_to dashboard_path(current_user)
  end

  def destroy
    @user = current_user
    @quote.destroy
    redirect_to dashboard_path(current_user)
  end

  private

  def quote_params
    params.require(:quote).permit(:title, :author)
  end

  def find_quote
    @quote = Quote.find(params[:id])
    authorize @quote
  end
end
