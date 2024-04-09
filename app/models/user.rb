class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to :age
         belongs_to :sex
         belongs_to :status
         belongs_to :favorite_title
         belongs_to :icon
         has_many :rooms
         has_many :messages

         validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の半角数字で入力してください" }
         validates :nick_name, :age_id, :sex_id, :status_id, :favorite_title_id, :icon_id, presence: true

         has_many :active_matches, class_name: "Match", foreign_key: :likes_id
         has_many :likes, through: :active_matches, source: :liked

         has_many :passive_matches, class_name: "Match", foreign_key: :liked_id
         has_many :liked, through: :passive_matches, source: :liked

         def liked_by?(user)
           liked =  passive_matches.find_by(likes_id: user.id)
           return liked.present?
         end

         def likes_by?(user)
           liked =  active_matches.find_by(liked_id: user.id)
           return likes.present?
         end
end
