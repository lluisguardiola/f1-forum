class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :driver_id
      t.integer :race_id
      t.integer :grid
      t.integer :place
      t.string :status
      t.integer :laps
      t.string :race_time, default: nil
      t.string :fastest_lap_time, default: nil
      t.string :fastest_lap, default: nil
      t.integer :fastest_lap_rank, default: nil
      t.decimal :avg_speed, :precision => 6, :scale => 3
      
      t.timestamps
    end
  end
end
