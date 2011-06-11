class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :options => 'ENGINE=INNODB' do |t|
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :head_photo_url, :null => false, :default => '/images/head/default.JPG'

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
