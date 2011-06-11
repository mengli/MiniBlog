class Profile < ActiveRecord::Base

  validates :nick_name, :presence => true
  validates :sex, :presence => true
  validates :province, :presence => true
  validates :city, :presence => true
  validates :birthday, :presence => true

  class << self
    def create_default_profile(user_id, email)
      @profile = Profile.new()
      @profile.nick_name = email
      @profile.birthday = Date.civil(1980, 1, 1)
      @profile.user_id = user_id
      @profile
    end

  end

end
