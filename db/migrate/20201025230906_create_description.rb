class CreateDescription < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string 'Header'
      t.text 'Description'
      t.timestamps
    end
  end
end
