class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :email_domain

  def email_domain
     domain = email.split("@").last
     if !email.blank?
       errors.add(:email, "Invalid Domain") if domain != "uno.edu"
     end
  end

  def set_to_grid_view
    update_attribute(:listing_view_type, "grid")
  end

  def set_to_list_view
    update_attribute(:listing_view_type, "list")
  end

end
