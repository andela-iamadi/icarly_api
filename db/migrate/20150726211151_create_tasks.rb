require 'date'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.date :due_date, :default => Date.today
      t.time :due_time
      t.integer :reminder, :default => 15
      t.string :alias
      t.string :category
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
