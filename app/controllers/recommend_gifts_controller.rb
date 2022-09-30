class RecommendGiftsController < ApplicationController
 
  def index
    @gave_gifts = GaveGift.all.order(created_at: :desc)
  end

end
