class AddUserToAccess < ActiveRecord::Migration[5.2]
  def change
    add_reference :accesses, :user, foreign_key: true
  end
end
