class ProjectsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource param_method: :project_params
  # before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    render json: Project.where(user_id: current_user).
                         order('position desc')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

    def project_params
      params.require(:project).permit(:user_id, :name, :position)
    end
end
