class AddPresentationPositionToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :presentation_position, :integer
  end
end
