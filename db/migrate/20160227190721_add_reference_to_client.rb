class AddReferenceToClient < ActiveRecord::Migration
  def change
    add_reference :users, :model, index: true, foreign_key: true
  end
end
