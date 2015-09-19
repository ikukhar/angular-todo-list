class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  before_save -> do
    self.uid = SecureRandom.uuid
  end
end
