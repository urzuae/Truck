class Developer < ActiveRecord::Base
  
  validates_presence_of :email, :github_login
  
  validates_uniqueness_of :email, :github_login
  
  def all_repos
    YAML::load(Net::HTTP.get(URI.parse("http://github.com/api/v2/yaml/repos/show/#{self.github_login}")))["repositories"]
  end
  
  def repos(projects)
    matches = []
    projects.each do |proj|
      collaborators = proj.collaborators
      unless collaborators.nil?
        if collaborators.include?(self.github_login)
          matches << proj unless matches.include?(proj)
        end
      end
      unless proj.commits["commits"].nil?
        unless proj.dev_commits(self).empty?
          matches << proj unless matches.include?(proj)
        end
      end
    end
    
    return matches
  end
  
end
