class AddToPresentationCategoryToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :presentation_category, :integer, null: false
  end
end
