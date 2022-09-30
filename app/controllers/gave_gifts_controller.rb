class GaveGiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :gift_page, only:[:show, :edit, :update]

  def index
    @gave_gifts = GaveGift.order("created_at DESC")
  end

  def new
    @gave_gift = GaveGift.new
  end

  def create
    @gave_gift = GaveGift.new(gave_gift_params)
    if @gave_gift.save
      redirect_to gave_gifts_path
   else
      render action: :new
   end
  end

  def show
    @gave_gift = GaveGift.find(params[:id])
  end

  def edit
    unless @gave_gift.user == current_user
      redirect_to gave_gift_path
    end
  end

  def update
    if @gave_gift.update(gave_gift_params)
      redirect_to gave_gift_path
    else
      render action :edit  
   end
  end 

  def destroy
    gave_gift = GaveGift.find(params[:id])
    unless gave_gift.user == current_user
      redirect_to gave_gift_path
    end
    gave_gift.destoroy
    redirect_to gave_gifts_path
  end
  
  private

  def gift_page
    @gave_gift = GaveGift.find(params[:id])
  end

  def gave_gift_params
    params.require(:gave_gift).permit(:image, :g_date, :g_content, :g_person, :g_shop, :g_situation, :g_memo, :recommend_id).merge(user_id: current_user.id)
  end

end
