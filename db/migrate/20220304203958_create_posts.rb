class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author
      t.string :authorId
      t.integer :likes
      t.float :popularity
      t.integer :reads
      t.text :tags

      t.timestamps
    end
  end
end
