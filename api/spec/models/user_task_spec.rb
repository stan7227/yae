# == Schema Information
#
# Table name: user_tasks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_tasks_on_task_id  (task_id)
#  index_user_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe UserTask, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
