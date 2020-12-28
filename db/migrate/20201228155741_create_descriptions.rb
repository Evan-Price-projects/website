class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :project_title
      t.text :description
      t.text :images
    end
  end
end
