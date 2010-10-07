class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :github_login
      t.string :github_token
      t.string :pivotal_login
      t.string :pivotal_token

      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
