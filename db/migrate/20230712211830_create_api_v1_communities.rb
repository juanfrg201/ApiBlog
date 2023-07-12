class CreateApiV1Communities < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_communities do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
