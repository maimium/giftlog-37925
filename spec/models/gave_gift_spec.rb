require 'rails_helper'

RSpec.describe GaveGift, type: :model do
  before do
    @gave_gift = FactoryBot.build(:gave_gift)
    @user = FactoryBot.build(:user)
  end

  describe '贈った物記録機能' do
    context '記録できる場合' do
      it 'すべての項目が入力されていると出品できること' do
        @gave_gift.valid?
        expect(@gave_gift).to be_valid
      end
      it 'メモが空でも記録できること' do
        @gave_gift.g_memo = ''
        @gave_gift.valid?
        expect(@gave_gift).to be_valid
      end
    end

    context '記録できない場合' do
      it '画像がついていないと出品できないこと' do
        @gave_gift.image = nil
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("画像を入力してください")
      end
      it '贈った日付が空だと記録できないこと' do
        @gave_gift.g_date = ''
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("贈った日付を入力してください")
      end
      it '内容が空だと記録できないこと' do
        @gave_gift.g_content = ''
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("内容を入力してください")
      end
      it '相手のお名前が空だと記録できないこと' do
        @gave_gift.g_person = ''
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("相手のお名前を入力してください")
      end
      it '購入場所が空だと記録できないこと' do
        @gave_gift.g_shop = ''
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("購入場所を入力してください")
      end
      it 'シチュエーションが空だと記録できないこと' do
        @gave_gift.g_situation = ''
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("シチュエーションを入力してください")
      end
      it 'おすすめするかどうかの情報が空だと出品できないこと' do
        @gave_gift.recommend_id = '1'
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("おすすめするかどうかを選択してください")
      end
      it 'ユーザー情報が紐付いていなければ出品できないこと' do
        @gave_gift.user = nil
        @gave_gift.valid?
        expect(@gave_gift.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
