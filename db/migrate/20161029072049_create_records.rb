class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :userinfo
      t.string :coursename
      t.datetime :trace

      t.timestamps null: false
    end
  end
end
