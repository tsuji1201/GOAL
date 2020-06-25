class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :image
      t.string :name
      t.string :country_id
      t.integer :position_id
      t.integer :age_id
      t.string :text
      t.timestamps
    end
  end
end
