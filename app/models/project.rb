class Project < ActiveRecord::Base
  
  #validates_presence_of :name, :repo_name, :owner
  
  #validates_uniqueness_of :name, :repo_name
  
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
  
  def dev_tasks(dev, pivotal)
    ticks = []
    proj = pivotal.project(self.pivotal_id)
    proj.tickets.each do |ticket|
      if ticket.owned_by == dev.name || ticket.requested_by == dev.name
        ticks << ticket unless ticks.include?(ticket)
      end
    end
    return ticks
  end
  
  def find_devs(developers)
    devs = []
    clbs = collaborators
    developers.each do |dev|
      if collaborators.include?(dev.user_github)
        devs << dev unless devs.include?(dev)
      end
    end
  end
  
end
