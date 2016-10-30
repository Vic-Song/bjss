class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.string :duration
      t.string :author
      t.references :chapter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
