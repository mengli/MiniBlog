class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections, :options => 'ENGINE=INNODB' do |t|
      t.integer :user_id, :null => false
      t.integer :message_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
