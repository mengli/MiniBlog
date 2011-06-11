class User < ActiveRecord::Base

  # linked_user_id is listened user id, while user_id is the host
  has_and_belongs_to_many :listeners, :class_name => "User", :join_table => "user_link_users", :association_foreign_key => "user_id", :foreign_key => "linked_user_id"

  has_and_belongs_to_many :focus_users, :class_name => "User", :join_table => "user_link_users", :association_foreign_key => "linked_user_id", :foreign_key => "user_id"
  
  has_many :messages, :foreign_key => 'userid'

  validates :email, :presence => true, :uniqueness => true

  attr_reader :passwd

  validate :passwd_must_be_present

  class << self
    def authenticate(email, password)
      if user = User.find_by_email(email)
        if user.password == encrypt_password(password)
          user
        end
      end
    end

    def encrypt_password(password)
      Digest::SHA2.hexdigest(password)
    end

  end

  def passwd=(passwd)
    @passwd = passwd
    if passwd.present?
      self.password = self.class.encrypt_password(passwd)
    end
  end

  private

  def passwd_must_be_present
    errors.add(:passwd, "Missing password" ) unless password.present?
  end
  
end
