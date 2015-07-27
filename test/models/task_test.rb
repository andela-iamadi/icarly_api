require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # post /tasks
  test "A new test can be created with a name, due_time " do
    task = Task.create(task: "Amity rooftop party", alias: "party", due_time: "12:00", user_id: 1)

    # require 'pry-nav'; binding.pry
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
end

#before :each do
#  @task = Task.new({ task: "Amity rooftop party", due_time: "12:00", user_id: "1" })
#end

#/task/new
#describe Task do
#  "it should return a Task object"
#  "It requires at least a task, due time, key_word and user_id"
#  "For non-specified cases of date, snooze and closed, defaults are date.now, 10mins and true"
#end
