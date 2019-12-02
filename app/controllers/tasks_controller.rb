class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to @task, notice: 'Succefully created'
    else
      flash[:alert] = "Can't be submit"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
