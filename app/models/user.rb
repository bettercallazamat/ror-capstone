class User < ApplicationRecord
  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followeds, through: :followings, source: :followed

  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :inverse_followings, source: :follower

  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 6, maximum: 30 }
end
