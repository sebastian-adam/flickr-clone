class AddAccountIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_id, :integer, index: true
  end
end
