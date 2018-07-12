class IndexSessionToken < ActiveRecord::Migration[5.1]
  def change
    add_index :cats, :session_token, unique: true
  end
end
