class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :text, presence: true, length: { minimum: 4, maximum: 100 }
end
