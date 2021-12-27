class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true
  validates :body, length: { in: 1..100 }
end
