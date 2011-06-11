class CreateUserLinkUsers < ActiveRecord::Migration
  def self.up
    create_table :user_link_users, :options => 'ENGINE=INNODB', :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :linked_user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :user_link_users
  end
end
