class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages, :options => 'ENGINE=INNODB' do |t|
      t.string :content, :null => false
      t.string :image
      t.integer :userid, :null => false
      t.string :user_nick_name, :null => false
      t.string :user_head_photo_url, :null => false
      t.integer :comment_count, :null => false, :default => 0

      t.timestamps
    end

    add_index :messages, [:created_at], :name => 'idx_messages_created_at'
  end

  def self.down
    drop_table :messages
  end
end
