class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title,   null: false
      t.string :author
      t.text :content
      t.integer :status, null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
