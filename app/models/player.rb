class Player < ApplicationRecord
  validates :image, :name, :country, :position_id, :age, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :position
  belongs_to_active_hash :age
  belongs_to_active_hash :country

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Player.all unless search
    Player
    .where('name LIKE(?)', "%#{search}%")
  end
end
