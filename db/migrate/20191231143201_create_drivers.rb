class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :firstname
      t.string :lastname
      t.string :abbr
      t.integer :car_number
      t.string :dob
      t.string :nationality 
      t.integer :team_id
  
      t.timestamps
    end
  end
end
