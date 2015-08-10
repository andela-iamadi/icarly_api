require 'test_helper'
require 'date'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = User.create( username: "elis", first_name: "Elis", last_name: "John")
    @task1 = @user.tasks.create(task: "Amity rooftop party", alias: "party", due_date: Date.yesterday(), due_time: "12:00")
    @task2 = @user.tasks.create(task: "Thoughtspot cleansing", alias: "TS", due_date: Date.current(), due_time: "12:00")
    @task3 = @user.tasks.create(task: "Checkout race", alias: "race", due_date: Date.current(), due_time: "14:00")
   end

  test "A new test can be created with a name, due_time, alias and user_id " do
    task = Task.create(task: "Amity rooftop party", alias: "slums", due_time: "12:00", user_id: 1)

    assert task.valid?
    refute task.invalid?
  end

  test "a vendor is not valid without a name" do
    task = Task.create(task: "Break code before pushing")
    task.task = nil
    task.save
    assert task.invalid?
    refute task.valid?
  end

  test "For non-specified cases of date, snooze and closed, defaults are date.now, 10mins and true" do
    task = Task.create(task: "Amity rooftop party", due_time: "12:00", user_id: "1")
    task.save
    assert task.invalid?
    refute task.valid?
  end

  test "The same alias cannot exist twice for a particular day" do
    task1 = @task1.dup
    task1.save
    assert task1.invalid?
  end

  test "The same alias can exist for different days" do
    task1 = @task1.dup
    task1["due_date"] = Date.current()
    task1.save
    assert task1.valid?
  end

end
