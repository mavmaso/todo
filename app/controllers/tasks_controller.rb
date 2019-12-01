class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      
    else
      
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
