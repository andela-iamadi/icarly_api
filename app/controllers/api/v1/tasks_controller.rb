class Api::V1::TasksController < ApplicationController

    def index
      if user_params && user_params["username"] == "cueBot"
        task = Task.all
        rendition(task, task)
      else
        params_init
        if @user && !@user.tasks.empty?
          task = !@args['alias'].nil? ? @user.tasks.find_by(alias: task_params['alias']) : @user.tasks.where(conditions).order(due_date: :desc, due_time: :desc).take(20)
          rendition(task, task)
        else
          rendition(task, 'Hey, create a task!')
        end
      end
    end

    def show_all
      params_init
      if @user && !@user.tasks.empty?
        task = !@args['alias'].nil? ? @user.tasks.find_by(alias: task_params['alias']) : @user.tasks.where(conditions).order(due_date: :desc, due_time: :desc).take(20)
        rendition(task, task)
      else
        rendition(task, "Hey, your task list is empty. create a task!")
      end
    end

    def create
      params_init
      if @user
        @args['due_date'] = Date.current() if !@args['due_date']
        task = @user.tasks.create(@args)
        rendition(task, "Task created successfully")
      else
        rendition(@user, "You have to be logged in to create a task")
      end
    end

    def show
      if user_params && user_params["username"] == "cueBot"
        task = Task.all
        rendition(task, task)
      else
      params_init
        if @user && !@user.tasks.empty?
          task = !@args['alias'].nil? ? @user.tasks.select_without(:user_channel, :message_channel, :frequency, :created_at, :user_id).find_by(alias: task_params['alias']) : @user.tasks.select_without(:user_channel, :message_channel, :frequency, :created_at, :user_id).where(conditions).order(due_date: :asc, due_time: :asc).take(20)
          rendition(task, task)
        else
          render json: { ok: true, message: 'Hey, create a task!' }
        end
      end
    end

    def update
      params_init
      if @user && @args.has_key?('alias') && !@user.tasks.empty?
        task = @user.tasks.find_by(alias: @args['alias'])
        task.update(@args) if !task.nil?
        rendition(task, "Task updated successfully")
      else
        rendition(task, "Hey, create a task or specify an existing alias")
      end
    end

    def destroy
      params_init
      if @user && @args.has_key?('alias') && !@user.tasks.empty?
        task = @user.tasks.find_by(alias: @args['alias']).destroy!
        rendition(task, "Task deleted successfully")
      else
        rendition(task, "Hey, specify the alias of the task you wish to delete")
      end
    end

    private

    def task_params
      params.require(:task).permit(:task, :due_date, :due_time, :alias, :reminder, :category, :message_channel, :user_channel, :frequency) if params.has_key? "task"
    end

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email) if params.has_key? "user"
    end

    def conditions
      params.require(:task).permit(:task, :due_date, :due_time, :alias, :reminder) if params.has_key? "task"
    end

    def params_init
      @user = !curr_user.nil? ? curr_user : nil
      @args = !task_params.nil? ? task_params : {}
    end

    def curr_user
      user = nil
      if !user_params.nil? && user_params.has_key?("username")
        user = User.find_by(username: user_params["username"])
        user = User.create(user_params) if !user
      end
      user
    end

    def rendition(obj, message)
      render json: !obj.respond_to?("errors") || obj.errors.empty? ? { message: message } : { ok: false, message: obj.errors.messages }
    end
end
