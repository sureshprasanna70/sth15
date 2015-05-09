class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.text :title
      t.text :content
      t.text :tags
      t.text :user_id

      t.timestamps
    end
  end
end
