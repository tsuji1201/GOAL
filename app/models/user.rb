class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :players
  has_many :comments       
  has_many :favorites, dependent: :destroy

  # validates :name, presence: true, uniqueness: true, length: { maximum: 8 }

  def already_favorited?(player)
    self.favorites.exists?(player_id: player.id)
  end
end
