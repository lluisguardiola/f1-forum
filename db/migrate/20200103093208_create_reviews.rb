class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.user :belongs_to
      t.integer :race_id
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
