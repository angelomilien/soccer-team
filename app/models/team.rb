class Team < ApplicationRecord
    has_many :players
    has_many :coaches, :class_name => "User", through: :players, :foreign_key => 'coach_id'

    belongs_to :country
    validates :name, :country_name, presence: true



    def country_name=(name)
        self.country = Country.find_or_create_by(name: name.capitalize)
    end
   
    def country_name
        self.country ? self.country.name : nil
    end
end