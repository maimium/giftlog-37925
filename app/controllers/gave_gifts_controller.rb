class GaveGiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :my_gift, only:[:show, :edit, :update]

  def index
    @gave_gifts = GaveGift.all.order(created_at: :desc)
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

  def my_gift
    @gave_gift = GaveGift.find(params[:id])
    unless @gave_gift.user.id == current_user.id
      redirect_to recommend_gifts_path
    end
  end

  def gave_gift_params
    params.require(:gave_gift).permit(:image, :g_date, :g_content, :g_person, :g_shop, :g_situation, :g_memo, :recommend_id).merge(user_id: current_user.id)
  end

end
