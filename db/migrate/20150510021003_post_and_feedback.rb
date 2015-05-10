class PostAndFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks,:forum_id,:integer
  end
end
