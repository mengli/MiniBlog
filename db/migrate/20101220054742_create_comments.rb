class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments, :options => 'ENGINE=INNODB' do |t|
      t.integer :user_id, :null => false
      t.integer :commented_user_id, :null => false
      t.integer :message_id, :null => false
      t.string :user_nick_name, :null => false
      t.string :user_head_photo_url, :null => false
      t.string :content, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
