class DelToken < ActiveRecord::Migration
  def change
    remove_column :users,:authenticable_tokens,:string
  end
end
