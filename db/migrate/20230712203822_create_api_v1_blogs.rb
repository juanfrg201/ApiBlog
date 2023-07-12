class CreateApiV1Blogs < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_blogs do |t|
      t.string :title
      t.string :body
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
