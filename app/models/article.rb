class Article < ActiveRecord::Base
  validates :course_code,:presence => true
  #~ validates :course_code, :length => {:maximum => 20}
  validates :name,:presence => true
  #~ validates :name, :length => {:maximum => 20}
  #validates :course_code, :uniqueness => {:message=>"Already a professor has been taken this course"}

  has_many :comments
end
