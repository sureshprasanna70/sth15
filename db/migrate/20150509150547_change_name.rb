class ChangeName < ActiveRecord::Migration
  def change
    rename_column :mappings,:post_id,:forum_id
  end
end
