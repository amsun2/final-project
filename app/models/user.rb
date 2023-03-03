# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:reviews, { :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:tbrs, { :class_name => "Tbr", :foreign_key => "user_id", :dependent => :destroy })
  
  has_many(:completeds, { :class_name => "Completed", :foreign_key => "user_id", :dependent => :destroy })
end
