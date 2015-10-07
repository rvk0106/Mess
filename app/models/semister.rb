class Semister < ActiveRecord::Base
  attr_accessor :university
  belongs_to :course
  has_many :subjects
end
