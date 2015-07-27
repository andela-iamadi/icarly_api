class Api::V1::TasksController < ApplicationController

    def index
      render json: Task.all
    end

    def edit
    end

    def post
    end

    def destroy

    end

end
