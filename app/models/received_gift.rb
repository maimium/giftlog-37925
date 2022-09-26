class ReceivedGift < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :r_date
    validates :r_content
    validates :r_person
    validates :r_situation
    validates :received_id, numericality: { other_than:1, message:"を選択してください", allow_blank: true }
  end

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :received

end
