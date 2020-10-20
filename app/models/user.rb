class User < ApplicationRecord
  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followeds, through: :followings, source: :followed

  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :inverse_followings, source: :follower

  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 6, maximum: 30 }

  def who_to_follow
    User.where.not(id: id).where.not(id: followeds).order('created_at DESC')
  end

  after_commit :add_default_photo, on: :create

  private 

  def add_default_photo 
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "imgs", "default-user.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end

  def add_default_photo 
    unless cover_image.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "imgs", "default-cover.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end


end
