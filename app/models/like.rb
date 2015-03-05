# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  liked      :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Like < ActiveRecord::Base
  belongs_to :user
end
