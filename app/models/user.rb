class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :name, :prof_student, :course
  validates :email,:presence => true
  validates :password,:presence => true, on: :create
  validates :name,:presence => true
  validates :prof_student,:presence => true
  
  validates_uniqueness_of :email
end
