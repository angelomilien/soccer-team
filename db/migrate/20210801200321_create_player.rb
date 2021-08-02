class CreatePlayer < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :position
      t.string :number
      t.integer  :coach_id
      t.integer  :team_id
      t.timestamps
    end
  end
end
