class Project < ActiveRecord::Base
  
  validates_presence_of :name
  
  validates_uniqueness_of :name, :repo_name
  
  def collaborators
    load_url("http://github.com/api/v2/yaml/repos/show/#{github_owner}/#{repo_name}/collaborators")["collaborators"]
  end
  
  def commits
    load_url("http://github.com/api/v2/yaml/commits/list/#{github_owner}/#{repo_name}/master")
  end
  
  def load_url(url)
    YAML::load(Net::HTTP.get(URI.parse(url)))
  end
  
  def dev_commits(dev)
    cmts = []
    commits = self.commits
    unless commits.nil?
      for commit in commits["commits"]
        if commit["author"]["login"] == dev.user_github
          cmts << commit unless cmts.include?(commit)
        end
      end
    end
    return cmts
  end
  
  def dev_tasks(dev)
    ticks = []
    proj = try_connection(self.pivotal_id)
    unless proj.nil?
      proj.tickets.each do |ticket|
        if ticket.owned_by == dev.name || ticket.requested_by == dev.name
          ticks << ticket unless ticks.include?(ticket)
        end
      end
    end
    return ticks
  end
  
  def find_devs(developers)
    devs = []
    clbs = collaborators
    cts = self.commits
    developers.each do |dev|
      unless clbs.nil?
        if clbs.include?(dev.user_github)
          devs << dev unless devs.include?(dev)
        end
      end
      unless cts["commits"].nil?
        for commit in cts["commits"]
          if commit["author"]["login"] == dev.user_github
            devs << dev unless devs.include?(dev)
          end
        end
      end
    end
    
    return devs
  end
  
  def try_connection(id)
    @pivotal = TicketMaster.new(:pivotal, {:username => 'urzuae', :password => 'redsox'})
    begin
      @pivotal.project(id)
    rescue
      nil
    end
  end
  
  
end
