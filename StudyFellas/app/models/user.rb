class User < ApplicationRecord
  has_one :profile
  has_many :belongings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  
  acts_as_user :roles => [:user, :admin]

  ## ADMIN METHODS ##
  def is_admin?
    return (self.roles_mask & 2) == 2
  end

  def set_admin
    self.roles_mask = (self.roles_mask | 2)
    self.save
  end

  def unset_admin
    self.roles_mask = 1
    self.save
  end
  ## ##


  ## USER METHODS ##
  def is_user?
    return (self.roles_mask & 1) == 1
  end

  def set_user
    self.roles_mask = (self.roles_mask | 1)
    self.save
  end

# def unset_user  
# end

  ## ##

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def build_default_profile(user_info, user_id)
    email = user_info[:email]
    reg_number = email.split(".")[1].split("@")[0].strip.to_i
    Profile.create!(:user_id => user_id, :name => user_info[:first_name], :surname => user_info[:last_name], :reg_number => reg_number)
  end

end
