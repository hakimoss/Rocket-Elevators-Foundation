class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :timeoutable, :lockable
  has_one :customer
  has_one :employee

  validate :password_complexity

  def is_employee?(user)
    if user.employee
      return true
    else
      return false
    end
  end



  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
