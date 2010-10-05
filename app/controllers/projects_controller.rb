class ProjectsController < ApplicationController
  before_filter :authenticate
  
  def index
    @projects = @pivotal.project.find
    @project = @projects.first
  end

  def find
    @project = @pivotal.project.find(:first, :name => params[:data_param])
    @tickets = @project.tickets
    @commits = YAML::load(Net::HTTP.get(URI.parse("http://github.com/api/v2/yaml/commits/list/urzuae/scrum/master")))
    render :json => [@project, @tickets, @commits]
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
    def authenticate
      @pivotal = TicketMaster.new(:pivotal, {:username => 'urzuae', :password => 'cinthiacee'})
    end
end
