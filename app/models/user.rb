class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :type
  has_many :user_subjects
  has_many :subjects, :through => :user_subjects
  attr_accessor :university
  attr_accessor :course
end
