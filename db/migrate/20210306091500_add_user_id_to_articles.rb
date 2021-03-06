class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :bigint
    add_index :articles, :user_id
    add_foreign_key :articles, :users
  end
end
