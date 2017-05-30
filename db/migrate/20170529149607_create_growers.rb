class CreateGrowers < ActiveRecord::Migration[5.0]
  def change
    create_table :growers do |t|
      t.string  :name,       null: false
      t.string  :title,      null: false
      t.string  :address
      t.string  :phone
      t.string  :url
      t.string  :about
      t.text    :description
      t.string  :logo
      t.integer :status,     null: false, default: 0, limit: 1  # default: active

      t.timestamps
    end
  end
end
