class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :description
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
