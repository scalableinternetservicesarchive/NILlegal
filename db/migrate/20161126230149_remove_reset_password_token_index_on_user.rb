class RemoveResetPasswordTokenIndexOnUser < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, :reset_password_token
    add_index :users, :reset_password_token
  end
end
