class UserFields < ActiveRecord::Migration
  def change
    add_column :users,:name,:string
    add_column :users,:college,:text
    add_column :users,:department,:string
    add_column :users,:year,:integer
  end
end
