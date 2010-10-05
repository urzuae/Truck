class DashboardController < ApplicationController
  def index
    @devs = Developer.all
    @projs = Project.all
  end

end
