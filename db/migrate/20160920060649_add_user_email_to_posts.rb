class AddUserEmailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_email, :string
  end
end
