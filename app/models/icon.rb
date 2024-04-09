class Icon < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メガリザードンY', image_path: 'rizay.png' },
    { id: 3, name: 'メガリザードンX', image_path: 'rizax.png' },
    { id: 4, name: 'メガクチート', image_path: 'mawile.png' },
    { id: 5, name: 'メガサーナイト', image_path: 'gardevoir.png' },
  ]

  include ActiveHash::Associations
  has_many :users

end
