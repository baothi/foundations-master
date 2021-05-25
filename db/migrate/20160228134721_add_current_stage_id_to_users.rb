class AddCurrentStageIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :stage, index: true, foreign_key: true
  end
end
