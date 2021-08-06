class User < ApplicationRecord
    has_many :players, :foreign_key => 'coach_id'
    has_many :teams, through: :players, :foreign_key => 'coach_id'

    validates :user_name, :email, presence: true
    validates :email, :user_name, uniqueness: true

    has_secure_password
end
# --no-test-framework