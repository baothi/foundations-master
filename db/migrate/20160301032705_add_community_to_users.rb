class AddCommunityToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :community, index: true, foreign_key: true
  end
end
