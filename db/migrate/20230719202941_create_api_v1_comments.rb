class CreateApiV1Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_comments do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :api_v1_blog, null: false, foreign_key: true, foreign_key: { to_table: :api_v1_blogs }

      t.timestamps
    end
  end
end
