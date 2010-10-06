class ProjectsController < ApplicationController
  before_filter :connect_piv
  
  def index
  end

  def find
    @project = Project.find_by_repo_name(params[:data_param])
    @proj = try_connection
    @tickets = @proj.nil? ? [] : @proj.tickets
    @commits = @project.commits
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      @saved = true
      @projects = Project.all
    else
      @saved = false
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
    else
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end
  
end
