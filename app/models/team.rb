class Team < ApplicationRecord
    has_many :players
    has_many :coaches, :class_name => "User", through: :players, :foreign_key => 'coach_id'

    belongs_to :country
end