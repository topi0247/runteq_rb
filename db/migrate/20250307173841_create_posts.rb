class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :rule_accepted, null: false, default: false
      t.timestamps
    end

    add_reference :posts, :user, foreign_key: true
  end
end
