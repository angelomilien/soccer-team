class Player < ApplicationRecord

    belongs_to :coach, :class_name => "User"
    belongs_to :team 
    validates :name, :age, :position, :number  presence: true

    accepts_nested_attributes_for :team

    # scope :order_by_popularity, -> { Workout.left_joins(:trainings).group(:id).order("count(trainings.workout_id) desc") }

    # accepts_nested_attributes_for :team
    # validates :team, :name, :age, :position, :number,  presence: true

    # def team_name=(name)
    #     self.team = Team.find_or_create_by(name: name)
    # end
   
    # def team_name
    #     self.team ? self.team.name : nil
    # end

    # def self.set_team_and_country(team_name, country_name)
    #     @country = Country.create(name: country_name)
    #     @team = @country.teams.build(name: team_name)
    #     @team.save
    #     @team
    # end
    
    


    # belongs_to :brand
    # belongs_to :user
    # has_many :customizations
    # accepts_nested_attributes_for :brand #brand_attributes=

    # def brand_attributes=(hash_of_attributes)
    #     # byebug
    #     if !hash_of_attributes["name"].blank? && !hash_of_attributes["year_founded"].blank?
    #         self.brand = Brand.find_or_create_by(hash_of_attributes)
            
    #     end
    # end

    # validates :condition, presence: true
    # validates :price, numericality: {greater_than: 0, less_than: 5000}
    # validates :color, presence: true, two_word: true, uniqueness: {scope: [:brand, :price]}


    # scope :order_by_price, -> {order(price: :desc)}
    # scope :order_by_condition, -> {order(:condition)}
    # scope :color_selector, -> (color) {where('color == ?', color)}
      
    # def name_and_color 
    #       "#{self.brand.name} - #{self.color} - #{self.condition}"
    #   end
  
     
  
    #   def self.order_by_price 
    #       self.order(price: :desc)
    #   end
end