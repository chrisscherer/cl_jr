class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.string :name
      t.string :key
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
