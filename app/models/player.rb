class Player < ApplicationRecord
  validates :image, :name, :country, :position, :age, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Player.all unless search
    Player
    .where('name LIKE(?)', "%#{search}%")
  end
end
