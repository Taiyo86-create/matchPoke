class FavoriteTitle < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'SV' },
    { id: 3, name: '剣盾' },
    { id: 4, name: 'GO' },
    { id: 5, name: 'Legends' },
  ]

  include ActiveHash::Associations
  has_many :users

end
