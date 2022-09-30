class ReceivedGiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :my_gift, only:[:show, :edit, :update]

  def index
    @received_gifts = ReceivedGift.all.order(created_at: :desc)
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
    received_gift.destroy
    redirect_to received_gifts_path
  end

  
  private

  def my_gift
    @received_gift = ReceivedGift.find(params[:id])
    unless @received_gift.user.id == current_user.id
      redirect_to recommend_gifts_path
    end
  end

  def received_gift_params
    params.require(:received_gift).permit(:image, :r_date, :r_content, :r_person, :r_shop, :r_situation, :r_memo, :received_id).merge(user_id: current_user.id)
  end
  
end
