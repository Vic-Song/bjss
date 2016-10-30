class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :userinfo
      t.string :coursename
      t.float :one
      t.float :two
      t.float :three
      t.float :four
      t.text :words

      t.timestamps null: false
    end
  end
end
