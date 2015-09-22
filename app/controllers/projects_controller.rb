class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects.json
  def index
    render json: Project.where(user_id: current_user).
                         order('id desc').
                         to_json(include: :tasks)
  end

  # GET /projects/1.json
  def show
    render json: @project.to_json
  end

  # POST /projects.json
  def create
    @project = Project.new(project_params)

    if @project.save
      render :show, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      render :show, status: :ok, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1.json
  def destroy
    @project.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name).merge(user_id: current_user.id)
    end
end
