class Subject < ActiveRecord::Base
  attr_accessor :university
  attr_accessor :course
  attr_accessor :semister
  has_many :user_subjects
  has_many :users, :through => :user_subjects
  has_one :semister
end
