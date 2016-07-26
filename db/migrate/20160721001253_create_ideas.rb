class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.references :project_owner, index: true, foreign_key: true
      t.integer :likes
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
