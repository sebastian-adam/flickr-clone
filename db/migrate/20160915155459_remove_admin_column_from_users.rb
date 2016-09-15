class RemoveAdminColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :admin, :boolean
  end
end
