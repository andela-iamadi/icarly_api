require 'test_helper'

class Api::V1::TasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get delete" do
    # require 'pry-nav'; binding.pry
    # get :delete
    # assert_response :success
  end

  test "the index action returns back json of all test" do
    task1 = Task.create(task: "Amity rooftop party", alias: "party", due_time: "12:00", user_id: 1)
    task2 = Task.create(task: "Thoughtspot cleansing", alias: "party", due_time: "12:00", user_id: 1)
    task3 = Task.create(task: "Checkout race", alias: "party", due_time: "12:00", user_id: 1)

    get :index
    tasks = JSON.parse(response.body)
    require 'pry'; binding.pry
    assert_equal 3, tasks.count
    assert_equal "Amity rooftop party", tasks[0]
    assert_equal "Thoughtspot cleansing", tasks[1]
    assert_equal "Checkout race", tasks[2]
  end

end
