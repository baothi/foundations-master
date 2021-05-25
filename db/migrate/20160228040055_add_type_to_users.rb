class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :lot, :string
  end
end
