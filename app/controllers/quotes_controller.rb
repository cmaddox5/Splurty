class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save!</strong> The data you entered isn\'t good enough. Enter a better quote'
      redirect_to new_quote_path
    else
      Quote.create(quote_params)
      redirect_to root_path
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
