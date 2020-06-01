class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :image
      t.string :name
      t.string :country
      t.string :position
      t.integer :age
      t.timestamps
    end
  end
end
