class User < ApplicationRecord
    has_many :players, :foreign_key => 'coach_id'
    has_many :teams, through: :players, :foreign_key => 'coach_id'

    has_secure_password

    validates :user_name, :email, presence: true
    validates :user_name, :email, uiqueness: true

# --no-test-framework