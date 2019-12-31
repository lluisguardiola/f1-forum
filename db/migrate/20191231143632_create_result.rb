class CreateResult < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :driver_id
      t.integer :race_id
      t.integer :placement
      t.string :race_time
      t.integer :qualifying_placement
      t.string :qualifying_lap
      t.string :fastest_lap
      t.string :grid_start
    
      t.timestamps
    end
  end
end
