class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.references :grower, foreign_key: true
      t.string  :title_la,        null: false
      t.string  :title,           null: false
      t.string  :hybrid_parentage
      t.integer :kind,            null: false, default: 0, limit: 1
      t.integer :zone_min,        null: false, default: 1
      t.integer :zone_max,        null: false, default: 11
      t.integer :quantity,        null: false, default: 1
      t.integer :planted_in
      t.integer :position
      t.integer :status,          null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
