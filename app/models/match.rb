class Match < ApplicationRecord
  belongs_to :likes, class_name: "User"
  belongs_to :liked, class_name: "User"
  has_many :messages
end
