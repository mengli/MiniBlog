class CreateForwards < ActiveRecord::Migration
  def self.up
    create_table :forwards, :options => 'ENGINE=INNODB' do |t|
      t.integer :user_id, :null => false
      t.integer :init_user_id, :null => false
      t.integer :init_message_id, :null => false
      t.integer :forward_message_id, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :forwards
  end
end
