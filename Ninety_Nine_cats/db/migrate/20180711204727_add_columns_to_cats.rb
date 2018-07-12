class AddColumnsToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :password_digest, :string, null: false
    add_column :cats, :session_token, :string, null: false
  end
end
