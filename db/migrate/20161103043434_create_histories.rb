class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :userinfo
      t.datetime :viewtime
      t.integer :videoinfo

      t.timestamps null: false
    end
  end
end
