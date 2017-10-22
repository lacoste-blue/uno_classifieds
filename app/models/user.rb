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
end
