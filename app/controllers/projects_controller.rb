# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy update_status create_comment]
  before_action :ensure_owner, only: %i[edit update destroy]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show; end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.owner = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_comment
    @comment = Comment.new(project_id: @project.id, user_id: current_user.id, content: comment_params[:content])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @project, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    respond_to do |format|
      if @project.update(status_params)
        StatusHistory.create!(project_id: @project.id, user_id: current_user.id, status: status_params[:status])
        format.html { redirect_to @project, notice: 'Project status was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_path, status: :see_other, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:owner_id, :name, :status)
  end

  def status_params
    params.require(:project).permit(:status)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def ensure_owner
    return if @project.owner == current_user

    flash[:error] = 'You are not the owner of this project.'
    redirect_to projects_path, status: :forbidden
  end
end
