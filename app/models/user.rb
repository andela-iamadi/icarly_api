class User < ActiveRecord::Base
	has_many :tasks

  validates :username, :presence => true
  validates :username, :uniqueness => true
end
