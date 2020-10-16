class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :text, presence: true, length: { minimum: 4, maximum: 300 }
end
