class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.belongs_to :user, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
