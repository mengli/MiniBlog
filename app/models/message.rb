class Message < ActiveRecord::Base

  belongs_to :user, :class_name => "User", :foreign_key => "userid"

  validate :content_must_be_present

  def content_must_be_present
    errors.add(:content, "Missing!" ) unless content.present?
  end

end
