class AddRelationPropertyUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :property_users, :user, foreign_key: true
    add_reference :property_users, :property, foreign_key: true
  end
end
