class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.text :project_title
      t.text :description
      t.text :images
    end
  end
end
