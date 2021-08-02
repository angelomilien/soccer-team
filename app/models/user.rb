class User < ApplicationRecord
    has_many :players, :foreign_key => 'coach_id'
    has_many :teams, through: :players, :foreign_key => 'coach_id'
end

# --no-test-framework