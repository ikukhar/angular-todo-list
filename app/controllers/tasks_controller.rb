class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
    render json: Task.where(project_id: params[:project_id]).order('position desc')
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:project_id, :name, :done, :position, :deadline)
    end
end
