class GaveGift < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :g_date
    validates :g_content
    validates :g_person
    validates :g_shop
    validates :g_situation
    validates :recommend_id, numericality: { other_than:1,message: "を選択してください", allow_blank: true }
  end

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :recommend
end