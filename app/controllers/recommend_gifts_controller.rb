class RecommendGiftsController < ApplicationController
 
  def index
    @gave_gifts = GaveGift.order("created_at DESC")
  end

  def show
  end

end
