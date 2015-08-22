class Task < ActiveRecord::Base
	belongs_to :user
  before_save { self.alias = self.alias.downcase }
  validates :task, presence: true, on: :create
	validates :alias, presence: true, uniqueness: { scope: [:due_date, :user_id], case_sensitive: false }
	validates :due_time, presence: true, on: :create
	validates :user_id, presence: true, on: :create

	scope :select_without, ->(*columns) { select(column_names - columns.map(&:to_s)))

end
