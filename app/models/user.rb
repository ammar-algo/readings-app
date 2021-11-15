class User < ApplicationRecord
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
         validates :password, length: { minimum: 8 }
        #  , unless: "password.nil?"
        #  jwt_revocation_strategy: JwtDenylist

        def generate_jwt
          JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
        end

    has_one :shop
    enum role: [:user, :admin]
    after_initialize do
      if self.new_record?
        self.role ||= :user
      end
    end
    
end
