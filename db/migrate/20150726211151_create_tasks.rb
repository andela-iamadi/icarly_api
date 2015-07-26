class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.date :due_date
      t.time :due_time
      t.integer :reminder
      t.string :keyword

      t.timestamps null: false
    end
  end
end
