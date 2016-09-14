class CreateJoinTableAccountPost < ActiveRecord::Migration[5.0]
  def change
    create_join_table :accounts, :posts do |t|
      t.index [:account_id, :post_id]
      t.index [:post_id, :account_id]
    end
  end
end
