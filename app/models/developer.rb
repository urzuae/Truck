class Developer < ActiveRecord::Base
  
  validates_presence_of :email, :user_github
  
  validates_uniqueness_of :email, :user_github
  
  def all_repos
    YAML::load(Net::HTTP.get(URI.parse("http://github.com/api/v2/yaml/repos/show/#{self.user_github}")))["repositories"]
  end
  
  def repos
    @projects = Project.all
    matches = []
    @projects.each do |proj|
      collaborators = proj.collaborators
      if collaborators.include?(self.user_github)
        matches << proj unless matches.include?(proj)
      end
      unless proj.dev_commits(self).empty?
        matches << proj unless matches.include?(proj)
      end
    end
    return matches
  end
  
end
