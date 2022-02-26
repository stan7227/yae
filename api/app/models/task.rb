# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 80 }
  validates :body, length: { maximum: 100 }

  has_many :user_tasks, dependent: :destroy
  has_many :user, through: :user_tasks
end
