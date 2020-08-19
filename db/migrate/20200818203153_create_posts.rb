class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, null: false, foreign_key: { to_table: :users } # user refers to author you are welcome future rudi. it's actually author but it's just referred to as a user.
      t.string :description

      t.timestamps
    end
  end
end
