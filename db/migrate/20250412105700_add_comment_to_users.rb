class AddCommentToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :comment, :string
  end
end
