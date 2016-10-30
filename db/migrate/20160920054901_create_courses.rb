class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :teacher
      t.text :teacher_intro
      t.text :description
      t.string :thumbnail_url
      t.string :trailer_url

      t.timestamps null: false
    end
  end
end
