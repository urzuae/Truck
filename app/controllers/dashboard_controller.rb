class DashboardController < ApplicationController
  def index
    @devs = Developer.all
    @projects = Project.all
  end

end
