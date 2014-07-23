class DashboardsController < ApplicationController
  def show
    @task = Task.new 
  end
    def create
    current_user.tasks.create(task_params)
    redirect_to dashboard_path
  end 
    private
    
  def task_params
    params.require(:task).permit(:title, :body)
  end
end
