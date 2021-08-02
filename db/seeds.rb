# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spain = Country.create(name:"Spain")

barca = Team.create(name:"Barcelona", country_id: spain.id)
real = Team.create(name:"Barcelona", country_id: spain.id)
    
santana = User.create(name: "Santana Rodriguez")
zidane = User.create(name:" Zinedine Zidane")

dinho = Player.create(name: "Ronaldinho", team_id: barca.id, coach_id: santana.id)
messi = Player.create(name: "Messi", team_id: barca.id, coach_id: santana.id)
cristiano = Player.create(name: "Cristiano Ronaldo", team_id: barca.id, coach_id: zidane.id)
di_maria = Player.create(name: "Angel Di Maria", team_id: barca.id, coach_id: zidane.id)

dinho.coach = santana
messi.coach = santana
cristiano.coach = zidane
di_maria.coach = zidane



