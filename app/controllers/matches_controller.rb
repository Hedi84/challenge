class MatchesController < ApplicationController

  before_action :set_product, except: [:destroy]

  def new
    @match = Match.new
    # @categories = Category.all.order(:name)
  end

  def create
    @match = Match.new(match_params)
    @match.product = @product
    if @match.save
     redirect_to show_path(@product)
   else
     render :new
   end
  end

  def destroy
    @match = Match.find(params[:id])
    @product = @match.product
    @match.destroy
    # go back to the product show page after removing category
    redirect_to show_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def match_params
    #since you add the category from the product show, the product_id is already
    # there
    params.require(:match).permit(:category_id)
  end
end
