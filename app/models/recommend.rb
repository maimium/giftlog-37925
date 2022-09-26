class Recommend < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'おすすめする' },
    { id: 3, name: '非公開のまま'}
  ]

  include ActiveHash::Associations
  has_many :gave_gifts
end
