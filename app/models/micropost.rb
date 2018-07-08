class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  

  has_many :favorites
  has_many :users, through: :favorites


  def bookmark(other_micropost)
    unless self == other_micropost
      self.favorites.find_or_create_by(micropost_id: other_micropost.id)
    end
  end
  def unbookmark(other_mocropost)
    favorite = self.favirites.find_by(micropost_id: other_micropost.id)
    favorite.destroy if favorite
  end
  def bookmarking?(other_micropost)
    self.bookmarkings.include?(other_micropost)
  end


end
