class CreateOverviews < ActiveRecord::Migration[5.0]
  def change
    create_table :overviews do |t|
      t.string  :name,    null: false
      t.string  :title,   null: false
      t.boolean :carousel
      t.text    :content
      t.string  :image
      t.date    :taken_at
      t.integer :position
      t.integer :status,   null: false, default: 0, limit: 1  # default: active

      t.timestamps
    end
  end
end
