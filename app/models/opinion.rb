class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :text, presence: true, length: { minimum: 4, maximum: 300 }

  scope :most_recent, -> { order(created_at: :desc) }
end
