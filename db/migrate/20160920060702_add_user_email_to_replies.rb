class AddUserEmailToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :user_email, :string
  end
end
