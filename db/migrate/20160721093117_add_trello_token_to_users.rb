class AddTrelloTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :trello_token, :string,:default => "N/A"
  end
end
