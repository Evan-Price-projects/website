class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.timestamps
      t.references 'card'
      t.references 'user'
      t.integer :UserID
    end
  end
end
