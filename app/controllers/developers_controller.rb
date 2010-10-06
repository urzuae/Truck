class DevelopersController < ApplicationController
  
  def index
    @developers = Developer.all
  end

  def show
    @projects = Project.all
    @dev = Developer.find(params[:id])
    @repos = @dev.repos(@projects)
  end

  def new
    @developer = Developer.new
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def create
    @developer = Developer.new(params[:developer])
    @saved = @developer.save ? true : false
    @devs = Developer.all
  end

  def update
    @developer = Developer.find(params[:id])
      if @developer.update_attributes(params[:developer])
      else
      end
  end

  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy
  end
end
