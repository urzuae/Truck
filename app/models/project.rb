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
    for commit in commits["commits"]
      if commit["author"]["login"] == dev.user_github
        cmts << commit unless cmts.include?(commit)
      end
    end
    return cmts
  end
end
