class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end

  def create
    rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    # save a completed rating to session
    current_user.ratings << rating
    redirect_to current_user
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to :back
  end
end