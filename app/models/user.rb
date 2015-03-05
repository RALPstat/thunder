# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  age                    :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  has_many :likes

  after_create :welcome_email

  # A random user I haven't like or unlike yet
  def random_friend
    restricted_ids = self.likes.pluck(:friend_id) << self.id
    User.where.not(id: restricted_ids).order("RANDOM()").first
  end

  def liked?(user)
    likes.find_by_friend_id(user.id)
  end

  private

  def welcome_email
    UserMailer.welcome_email(self).deliver 
  end


end
