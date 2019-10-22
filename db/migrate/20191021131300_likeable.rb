class Likeable < ActiveRecord::Migration[6.0]
  def change
  	add_column :likes, :likeable_id, :integer
  	add_column :likes, :likeable_type, :string
  end
end
