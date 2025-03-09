class AddToTagertCategoryToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :target_category, :integer, null: false
  end
end
