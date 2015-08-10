require 'test_helper'
require 'date'

class Api::V1::TasksControllerTest < ActionController::TestCase
  def setup
    @user = User.create( username: "elis", first_name: "Elis", last_name: "John")
    @task1 = @user.tasks.create(task: "Amity rooftop party", alias: "party", due_date: Date.yesterday(), due_time: "12:00")
    @task2 = @user.tasks.create(task: "Thoughtspot cleansing", alias: "TS", due_date: Date.current(), due_time: "12:00")
    @task3 = @user.tasks.create(task: "Checkout race", alias: "race", due_date: Date.current(), due_time: "14:00")
   end

  test "the index action returns back json of all task for a user without other conditions specified" do
    get :index, id: @user.id, user: { username: "elis" }
    tasks = JSON.parse(response.body)
    assert_equal 3, tasks["message"].count
  end

<<<<<<< HEAD
  test "the index action returns task list arranged with most recent at the top" do
    get :index, id: @user.id, user: { username: "elis" }
    tasks = JSON.parse(response.body)
    assert_equal "Checkout race", tasks["message"][0]["task"]
    assert_equal "Thoughtspot cleansing", tasks["message"][1]["task"]
    assert_equal "Amity rooftop party", tasks["message"][2]["task"]
  end

  test "the show action can tailor down request with respect to conditions in desc order" do
    get :show, id: @user.id, user: { username: "elis" }, task: { due_date: Date.current() }
    tasks = JSON.parse(response.body)
    assert_equal "Checkout race", tasks["message"][0]["task"]
  end

  test "the create action creates a task for a user specified" do
    assert_difference '@user.tasks.count', 1 do
      post :create, task: {task: "Get up with Minitest", alias: "MT", due_date: Date.current(), due_time: "01:00" }, user: { username: @user.username }
    end
  end

  test "the update action edits a task in the database" do
    prev_task = @task1['task']
    patch :update, id: "", user: {username: @user.username }, task: { task: "Edit test", due_date: Date.current(), due_time: Time.current(), alias: @task1['alias'] }
    edited_task = @user.tasks.find_by(alias: @task1.alias).task
    assert_equal edited_task, "Edit test"
    assert_not_equal prev_task, edited_task
  end

  test "update action edits a task only if its alias stays unique in a day" do
    prev_task = @task1['task']
    patch :update, id: "", user: {username: @user.username }, task: { task: "Edit test", due_date: Date.current(), due_time: @task1['due_time'], alias: @task1['alias'] }
    assert_equal prev_task, @task1['task']
    assert_not_equal @task1['task'], "Edit test"
  end

  test "the delete action deletes the specified task at the specified alias" do
    assert_difference '@user.tasks.count', -1 do
      delete :destroy, id: "", task: { alias: 'race' }, user: { username: @user.username }
    end
  end

  test "the delete action doesn't delete unless the alias is specified" do
    assert_no_difference '@user.tasks.count' do
      delete :destroy, id: "", task: { due_date: Date.current() }, user: { username: @user.username }
    end

  test "should get delete" do
    # get :delete
    # assert_response :success
  end

  test "the index action returns back json of all test" do
    task1 = Task.create(task: "Amity rooftop party", alias: "party", due_time: "12:00", user_id: 1)
    task2 = Task.create(task: "Thoughtspot cleansing", alias: "party", due_time: "12:00", user_id: 1)
    task3 = Task.create(task: "Checkout race", alias: "party", due_time: "12:00", user_id: 1)

    get :index
    tasks = JSON.parse(response.body)
    assert_equal 3, tasks.count
    assert_equal "Amity rooftop party", tasks[0]
    assert_equal "Thoughtspot cleansing", tasks[1]
    assert_equal "Checkout race", tasks[2]

  end

end
