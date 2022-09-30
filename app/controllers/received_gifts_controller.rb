class ReceivedGiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :gift_page, only:[:show, :edit, :update]

  def index
    @received_gifts = ReceivedGift.order("created_at DESC")
  end

  def new
    @received_gift = ReceivedGift.new
  end

  def create
    @received_gift = ReceivedGift.new(received_gift_params)
    if @received_gift.save
      redirect_to received_gifts_path
   else
      render action: :new
   end
  end

  def show
    @received_gift = ReceivedGift.find(params[:id])
  end

  def edit
    unless @received_gift.user == current_user
      redirect_to received_gift_path
    end
  end


  def update
    if @received_gift.update(received_gift_params)
      redirect_to received_gift_path
    else
      render action :edit  
   end
  end 

  def destroy
    received_gift = ReceivedGift.find(params[:id])
    unless received_gift.user == current_user
      redirect_to  received_gift_path
    end
    received_gift.destoroy
    redirect_to received_gifts_path
  end

  
  private

  def gift_page
    @received_gift = ReceivedGift.find(params[:id])
  end

  def received_gift_params
    params.require(:received_gift).permit(:image, :r_date, :r_content, :r_person, :r_shop, :r_situation, :r_memo, :received_id).merge(user_id: current_user.id)
  end
  
end
