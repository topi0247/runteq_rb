class AddSelectionToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :selection, :integer, default: 0
  end
end
