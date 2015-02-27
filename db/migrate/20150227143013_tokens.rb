class Tokens < ActiveRecord::Migration
  def change
    add_column :users,:authenticable_tokens,:string
  end
end
