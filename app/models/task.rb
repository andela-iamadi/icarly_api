class Task < ActiveRecord::Base
	belongs_to :user

  validates :task, :presence => true
	validates :alias, :presence => true
	validates :due_time, :presence => true
	validates :user_id, :presence => true,  :on => :create
end
