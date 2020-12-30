class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :location
      t.integer :status
      t.string :cardFront
      t.integer :UserID
      t.timestamps
    end
  end
end