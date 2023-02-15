class CreateParlors < ActiveRecord::Migration[7.0]
  def change
    create_table :parlors do |t|
      t.string :name
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
