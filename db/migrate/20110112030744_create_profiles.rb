class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles, :options => 'ENGINE=INNODB' do |t|
      t.integer :user_id, :null => false
      t.string :nick_name, :null => false
      t.integer :sex, :null => false, :limit => 1, :default => 0
      t.string :province, :null => false, :default => "Beijing"
      t.string :city, :null => false, :default => "Beijing"
      t.date :birthday, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
