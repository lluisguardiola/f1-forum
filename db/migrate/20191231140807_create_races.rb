class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :venue_id
      t.date :date
      t.string :start_time
    
      t.timestamps
    end
  end
end
