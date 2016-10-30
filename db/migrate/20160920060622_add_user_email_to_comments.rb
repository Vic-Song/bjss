class AddUserEmailToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_email, :string
  end
end
