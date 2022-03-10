class AddUserReferenceToMyWishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :my_wishes, :users
    add_index :my_wishes, :user_id
    change_column_null :my_wishes, :user_id, false
  end
end
