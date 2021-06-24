class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # user -> posts
  has_many :posts, dependent: :destroy

  # user -> likes
  has_many :likes, dependent: :destroy

  # user -> likes -> posts
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
