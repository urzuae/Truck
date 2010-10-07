class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :repo_name
      t.string :pivotal_id
      t.string :github_owner

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
