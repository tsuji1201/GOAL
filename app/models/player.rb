class Player < ApplicationRecord
  validates :image, :name, :country, :position, :age, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Player.all unless search
    Player
    .where('name LIKE(?)', "%#{search}%")
  end
end
