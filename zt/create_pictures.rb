class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :plant,    foreign_key: true
      t.integer    :kind,     null: false, default: 1, limit: 1
      t.string     :title,    null: false
      t.text       :content
      t.string     :photo
      t.date       :taken_at
      t.integer    :position
      t.integer    :status,   null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
