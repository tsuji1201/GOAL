class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :image,          null: false
      t.string :name,         null: false
      t.string :country_id,   null: false
      t.integer :position_id, null: false, foreign_key: true
      t.integer :age_id,      null: false, foreign_key: true
      t.string :text
      t.timestamps
    end
  end
end
