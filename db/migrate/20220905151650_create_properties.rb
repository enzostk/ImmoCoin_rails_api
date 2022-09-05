class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.text :title
      t.integer :price
      t.text :description
      t.integer :surface

      t.timestamps
    end
  end
end
