class CreatePropertyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :property_users do |t|

      t.timestamps
    end
  end
end
