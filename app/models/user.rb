class User < ApplicationRecord
    has_many :players, :foreign_key => 'coach_id'
    has_many :teams, through: :players, :foreign_key => 'coach_id'

    validates :user_name, :email, presence: true
    validates :email, :user_name, uniqueness: true

    has_secure_password

    def self.from_google_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
          u.email = auth['info']['email']
          u.user_name = auth['info']['name']
          u.password = SecureRandom.hex(15)
        end
    end
end