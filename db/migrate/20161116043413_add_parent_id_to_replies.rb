class AddParentIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :parent_id, :integer,default:0
  end
end
