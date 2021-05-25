class CreateActivities < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :activities do |t|
      t.string :type
      t.integer :performer_id
      t.hstore :details

      t.timestamps null: false
    end
  end
end
