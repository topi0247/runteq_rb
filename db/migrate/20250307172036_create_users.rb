class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :icon_url
      t.integer :role, default: 0
      t.string :x_id
      t.string :social_portfolio_url
      t.timestamps
    end
  end
end
