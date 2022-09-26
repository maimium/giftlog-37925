require 'rails_helper'

RSpec.describe ReceivedGift, type: :model do
  before do
    @received_gift = FactoryBot.build(:received_gift)
    @user = FactoryBot.build(:user)
  end

  describe 'いただいた物記録機能' do
    context '記録できる場合' do
      it 'すべての項目が入力されていると出品できること' do
        @received_gift.valid?
        expect(@received_gift).to be_valid
      end
      it 'メモが空でも記録できること' do
        @received_gift.r_memo = ''
        @received_gift.valid?
        expect(@received_gift).to be_valid
      end
    end

    context '記録できない場合' do
      it '画像がついていないと出品できないこと' do
        @received_gift.image = nil
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("画像を入力してください")
      end
      it '贈った日付が空だと記録できないこと' do
        @received_gift.r_date = ''
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("いただいた日付を入力してください")
      end
      it '内容が空だと記録できないこと' do
        @received_gift.r_content = ''
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("内容を入力してください")
      end
      it '相手のお名前が空だと記録できないこと' do
        @received_gift.r_person = ''
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("相手のお名前を入力してください")
      end
      it 'シチュエーションが空だと記録できないこと' do
        @received_gift.r_situation = ''
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("シチュエーションを入力してください")
      end
      it 'お返し済みかどうかの情報が空だと出品できないこと' do
        @received_gift.received_id = '1'
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("お返し済みかどうかを選択してください")
      end
      it 'ユーザー情報が紐付いていなければ出品できないこと' do
        @received_gift.user = nil
        @received_gift.valid?
        expect(@received_gift.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
