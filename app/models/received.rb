class Received < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'はい'},
    { id: 3, name: 'いいえ'}
  ]

  include ActiveHash::Associations
  has_many :received_gifts
end
