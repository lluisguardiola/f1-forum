class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :round
      t.string :date
      t.string :time
      t.integer :venue_id
    
      t.timestamps
    end
  end
end
