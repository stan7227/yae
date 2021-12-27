class Article < ApplicationRecord
  belongs_to :user
  has_many :article_likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :titile, presence: true
  validates :titile, length: { in: 1..40 }
  validates :body, presence: true
  validates :body, length: { in: 1..100 }
end
