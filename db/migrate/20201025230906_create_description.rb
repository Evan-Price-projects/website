class CreateDescription < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string 'header'
      t.text 'info'
      t.timestamps
    end
  end
end
