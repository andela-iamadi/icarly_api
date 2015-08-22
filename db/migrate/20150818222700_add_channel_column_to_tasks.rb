class AddChannelColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_channel, :string
    add_column :tasks, :message_channel, :string
    add_column :tasks, :frequency, :integer
  end
end
