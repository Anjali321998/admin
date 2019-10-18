class DropRequestsTable < ActiveRecord::Migration[6.0]
  def change
  	drop_table(:friend_requests)
  end
end
