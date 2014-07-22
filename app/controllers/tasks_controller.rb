class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    current_user.tasks.create(task_params)
    redirect_to dashboard_path
  end

  def edit
    @task = get_task
  end
  
  def update
    task = get_task
    task.update(task_params)
    redirect_to dashboard_path
  end

  def destroy
    task = get_task
    task.destroy
    redirect_to dashboard_path
  end

  private

  def get_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
