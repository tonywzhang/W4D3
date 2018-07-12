class RemovePasswordColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :cats, :password_digest, :sting
    remove_column :cats, :session_token, :sting
  end
end
