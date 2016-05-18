class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :caption

      t.timestamps
    end
  end
end
