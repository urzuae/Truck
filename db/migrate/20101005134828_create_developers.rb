class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :user_github

      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
