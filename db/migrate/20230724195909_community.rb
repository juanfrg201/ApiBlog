class Community < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_communities, :description, :string
  end
end
